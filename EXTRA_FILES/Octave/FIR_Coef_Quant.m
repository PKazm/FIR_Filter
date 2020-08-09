pkg load signal

tap_width = 12;
taps = 127;
edges = [0 .042 0.08410 1];
values = [1 1 0 0];
b = remez(taps-1, edges, values);
w = linspace(0,2*pi,1000);

H = freqz(b,1,w);


%{
    Now to make everything into binary form
%}


b_int = int32(b*((2**(tap_width - 1) - 1)/max(abs(b))));
H_int = freqz(double(b_int),1,w);

coef_sum = sum(b_int)

%{
    Plot the interesting stuff
%}

subplot(2,2,1);
title('Real taps');
stem(b);

subplot(2,2,2);
title('Real Response');
plot(w,abs(H));

subplot(2,2,3);
title('Int taps');
stem(b_int);

subplot(2,2,4);
title('INT Response');
plot(w,abs(H_int));

%{
    Record the bits I want for importing into RTL
%}

fid = fopen("Filter_Taps.hex", "w");
for tap = b_int(1 : (taps - 1) / 2 + 1)
    output = [num2hex(tap)];
    fdisp(fid,substr(output, -3));
end
fclose(fid);