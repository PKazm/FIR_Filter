close all;
clear all;

pkg load signal
pkg load parallel

%{
    Inputs and Controls
%}

CONSOLE_OUT = 0;
STOP_AT_FIRST = 1;


bandwidth = 48000/2;
pass_freq = 1000;
stop_freq = 3000;
tap_width = 18;
taps_start = 1;
taps = 127;

stop_step = 0.0001;
global max_pass_ripple = 0.01;
global max_stop_ripple = 0.01;
global quant_dec_max = .99;
global quant_dec_min = quant_dec_max - .02;
processes = nproc - 4;

pass_dec = pass_freq / bandwidth;
stop_dec = stop_freq / bandwidth;
stop_delta = stop_dec - pass_dec;

global tap_max_val = 2**(tap_width - 1) - 1;
edges = [0, pass_dec, pass_dec + stop_step, 1];
global values = [1, 1, 0, 0];
global weights = [1, 1];
w = linspace(0,2*pi,1000);






%{
    The Stuff
%}

global edges_iterate = [];
stop_freq = [];
for i = 0 : stop_step : stop_delta
    edges_iterate = [edges_iterate; edges(1), edges(2), edges(3) + i, edges(4)];
    stop_freq = [stop_freq, edges(3) + i];
end
#edges_iterate = edges;
best_edges = edges;
best_stop_freq = 0;
best_tap_N = 0;
best_taps = [];
best_taps_int = [];
best_quant = 0;
best_quant_er = 0;
best_pass_rip = 1;
best_stop_rip = 1;
best_pass_rip_good = 0;
best_stop_rip_good = 0;


function [valid, edges, tap_N, taps, taps_int, quant, quant_dec, pass_rip, stop_rip] = find_best_coef(taps_N)
    
    
    
    global CONSOLE_OUT;
    global quant_dec_max;
    global quant_dec_min;
    global max_pass_ripple;
    global max_stop_ripple;
    global tap_max_val;
    global values;
    global edges_iterate;
    
    
    valid = 0;
    edges = [];
    taps = [];
    taps_int = [];
    quant = 0;
    quant_dec = 0;
    pass_rip = 1;
    stop_rip = 1;
    
    
    for edge = edges_iterate.'
        try
            b = remez(taps_N-1, edge, values);
        catch err
            #disp(err)
            if(CONSOLE_OUT == 1)
                disp("error");
            endif
            continue
        end
        
        b_int = int32((b*tap_max_val)/max(abs(b)));
        
        coef_sum = sum(b_int);
        coef_sum_log2 = log2(coef_sum);
        coef_sum_log2_dec = coef_sum_log2 - floor(coef_sum_log2);
        
        w_test = linspace(0,pi*edge(2),1000);
        h_pass_test = abs(freqz(b,1,w_test));
        ripple_err_pass = max(abs(h_pass_test - 1));
        
        w_test = linspace(pi*edge(3),pi,1000);
        h_stop_test = abs(freqz(b,1,w_test));
        ripple_err_stop = max(h_stop_test);
        
        quant_good = 0;
        
        if(quant_dec_min < coef_sum_log2_dec && coef_sum_log2_dec < quant_dec_max)
            quant_good = 1;
        end
        
        save_run = 0;
        # Check if its the best so far, if so, store it
        if(quant_good == 1 &&
                (pass_rip > ripple_err_pass) &&
                (stop_rip > ripple_err_stop))
            # acceptably quantizable, now calc ripple
            # acceptable pass ripple
            # acceptable stop ripple
            save_run = 1;
        end
        
        if(save_run == 1)
            valid = 1;
            edges = edge;
            pass_rip = ripple_err_pass;
            stop_rip = ripple_err_stop;
            quant_dec = coef_sum_log2_dec;
            quant = coef_sum_log2;
            taps = b;
            taps_int = b_int;
            tap_N = taps_N;
        end
    end
    
endfunction


find_best_coef_2 = @(A)FIR_Coef_Quant_Length_Function_File(
                                            CONSOLE_OUT,
                                            A,
                                            quant_dec_max,
                                            quant_dec_min,
                                            max_pass_ripple,
                                            max_stop_ripple,
                                            tap_max_val,
                                            values,
                                            weights,
                                            edges_iterate);


found = 0;
taps_array = taps_start : 2 : taps;
taps_index = 1;

while(found == 0)
    taps_index_end = taps_index + processes;
    if(taps_index_end > columns(taps_array))
        taps_index_end = columns(taps_array);
        found = 1;
    endif
    batch_taps = taps_array(taps_index : taps_index_end);
    taps_index = taps_index_end;
    valid = [];
    stop_freq = [];
    taps = [];
    taps_int = [];
    quant = [];
    quant_dec = [];
    pass_rip = [];
    stop_rip = [];
    pass_rip_good = [];
    stop_rip_good = [];
    
    #[valid, stop_freq, tap_N, quant, quant_dec, pass_rip, stop_rip] = pararrayfun(processes, find_best_coef_2, batch_taps);
    [valid, stop_freq, quant, quant_dec, pass_rip, stop_rip, pass_rip_good, stop_rip_good] = pararrayfun(processes, find_best_coef_2, batch_taps);
    disp(["results received | ", num2str(valid)]);
    
    for i = 1 : columns(valid)
        new_best = 0;
        if(valid(i) == 1)
            if((pass_rip(i) < best_pass_rip && stop_rip_good(i) == 1) || (stop_rip(i) < best_stop_rip && pass_rip_good(i) == 1))
                # one side passes (perhaps "worse" but acceptable ripple) while the other non compliant ripple improves
                new_best = 1;
            elseif(pass_rip(i) < best_pass_rip && stop_rip(i) < best_stop_rip)
                new_best = 1;
            end
            if(best_pass_rip < max_pass_ripple && best_stop_rip < max_stop_ripple)
                if(STOP_AT_FIRST == 1)
                    found = 1;
                endif
            endif
        end
        
        if(new_best == 1)
            #best_edges = edges(i);
            best_stop_freq = stop_freq(i);
            best_pass_rip = pass_rip(i);
            best_stop_rip = stop_rip(i);
            best_pass_rip_good = pass_rip_good(i);
            best_stop_rip_good = stop_rip_good(i);
            best_quant_er = quant_dec(i);
            best_quant = quant(i);
            #best_taps = taps(i);
            #best_taps_int = taps_int(i);
            best_tap_N = batch_taps(i);
        end
        
        if(found == 1)
            break;
        end
    endfor
    
    disp([num2str(best_quant_er), ", ", num2str(best_pass_rip), ", ", num2str(best_stop_rip)]);
    
    
    if(found == 1)
        best_edges = [edges(1), edges(2), best_stop_freq, edges(4)];
        best_taps = remez(best_tap_N-1, best_edges, values);
        best_taps_int = int32((best_taps*tap_max_val)/max(abs(best_taps)));
        break
    end
    
endwhile

#{
for taps_try = 1 : 2 : taps;
    
    disp(taps_try);
    
    
    taps_result = find_best_coef(taps_try);
    
    if(taps_result(1) == 1)
        if(taps_result(8) < best_pass_rip && taps_result(9) < best_stop_rip)
            best_edges = taps_result(2);
            best_pass_rip = taps_result(8);
            best_stop_rip = taps_result(9);
            best_quant_er = taps_result(7);
            best_quant = taps_result(6);
            best_taps = taps_result(4);
            best_taps_int = taps_result(5);
            best_tap_N = taps_result(3);
        end
    end
    
    
    if(best_pass_rip < max_pass_ripple && best_stop_rip < max_stop_ripple)
        found = 1;
    endif
    
    
    if(found == 1)
        break
    end
end
#}
    
H = freqz(best_taps,1,w);
H_int = freqz(double(best_taps_int),1,w);




%{
    Plot the interesting stuff
%}

subplot(2,2,1);
title('Real taps');
stem(best_taps);

subplot(2,2,2);
title('Real Response');
plot(w,abs(H));

subplot(2,2,3);
title('Int taps');
stem(best_taps_int);

subplot(2,2,4);
title('INT Response');
plot(w,abs(H_int));

%{
    Record the bits I want for importing into RTL
%}

fid = fopen("Filter_Taps.hex", "w");

fdisp(fid, ["//Taps : ", num2str(best_tap_N)]);
fdisp(fid, ["//Gain Bits : ", num2str(ceil(best_quant))]);
fdisp(fid, ["//Edges : ", num2str(best_edges)]);
fdisp(fid, ["//Freqs : ", num2str(best_edges * bandwidth)]);
fdisp(fid, ["//Gain : ", num2str(best_quant)]);
fdisp(fid, ["//Pass Ripple : ", num2str(best_pass_rip)]);
fdisp(fid, ["//Stop Ripple : ", num2str(best_stop_rip)]);
fdisp(fid, "\n");

for tap = best_taps_int(1 : (best_tap_N - 1) / 2 + 1)
    output = [num2hex(tap)];
    fdisp(fid, substr(output, -(ceil(log2(tap_width)))));
end
fclose(fid);