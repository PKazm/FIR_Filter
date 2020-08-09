#function [valid, stop_freq, tap_N, quant, quant_dec, pass_rip, stop_rip] = FIR_Coef_Quant_Length_Function_File(
function [valid, stop_freq, quant, quant_dec, pass_rip, stop_rip, pass_rip_good, stop_rip_good] = FIR_Coef_Quant_Length_Function_File(
                CONSOLE_OUT,
                taps_N,
                quant_dec_max,
                quant_dec_min,
                max_pass_ripple,
                max_stop_ripple,
                tap_max_val,
                values,
                weights,
                edges_iterate)

    pkg load signal

    disp([num2str(taps_N), " started"]);
    
    valid = 0;
    stop_freq = 0;
    quant = 0;
    quant_dec = 0;
    pass_rip = 1;
    stop_rip = 1;
    pass_rip_good = 0;
    stop_rip_good = 0;

    found_one = 0;
    
    
    for edge = edges_iterate.'
        warning("off");
        try
            b = remez(taps_N-1, edge, values, weights);
        catch err
            continue
        end
        warning("on");
        
        b_int = int32((b*tap_max_val)/max(abs(b)));
        
        
        w_test = linspace(0,pi*edge(2),1000);
        h_pass_test = abs(freqz(b,1,w_test));
        ripple_err_pass = max(abs(h_pass_test - 1));
        
        w_test = linspace(pi*edge(3),pi,1000);
        h_stop_test = abs(freqz(b,1,w_test));
        ripple_err_stop = max(h_stop_test);


        coef_sum = sum(b_int) * (1 + (ripple_err_pass));
        coef_sum_log2 = log2(coef_sum);
        coef_sum_log2_dec = coef_sum_log2 - floor(coef_sum_log2);
        
        quant_good = 0;
        pass_good = 0;
        stop_good = 0;
        
        if(quant_dec_min < coef_sum_log2_dec && coef_sum_log2_dec < quant_dec_max)
            quant_good = 1;
        end
        if(ripple_err_pass < pass_good)
            pass_good = 1;
        end
        if(ripple_err_stop < stop_good)
            stop_good = 1;
        end
        
        save_run = 0;
        # Check if its the best so far, if so, store it
        if(quant_good == 1)
            if(stop_good == 1 && pass_good == 1)
                # acceptably quantizable, now calc ripple
                # acceptable pass ripple
                # acceptable stop ripple
                if(ripple_err_pass < pass_rip && ripple_err_stop < stop_rip)
                    save_run = 1;
                    found_one = 1;
                end
            elseif(found_one == 0)
                # if not fully compliant, store the best attempts
                if((ripple_err_pass < pass_rip && stop_good == 1) || (ripple_err_stop < stop_rip && pass_good == 1))
                    # one side passes (perhaps "worse" but acceptable ripple) while the other non compliant ripple improves
                    save_run = 1;
                elseif(ripple_err_pass < pass_rip && ripple_err_stop < stop_rip)
                    # overall improvement, but not within desired ranges
                    save_run = 1;
                end
            end
        end
        
        if(save_run == 1)
            valid = 1;
            stop_freq = edge(3);
            pass_rip = ripple_err_pass;
            stop_rip = ripple_err_stop;
            pass_rip_good = pass_good;
            stop_rip_good = stop_good;
            quant_dec = coef_sum_log2_dec;
            quant = coef_sum_log2;
            #taps = b;
            #taps_int = b_int;
            tap_N = taps_N * 1;

            if(CONSOLE_OUT == 1)
                disp([num2str(taps_N), " : ", num2str(edge), " = ", num2str(quant)]);
            endif
        end
    end
    disp([num2str(taps_N), " is complete"]);
endfunction
