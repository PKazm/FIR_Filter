pkg load signal;

close all;
clear all;

smpl_width = 24;
smpl_N = 28801;
smpl_rate = 48000;
freq = 15000;


times = [0:1/smpl_rate:.6];
freq_0 = 2000;
time_t1 = .04;
freq_1 = 0;
shape = "linear";

chirp_smpls = chirp(times, freq_0, time_t1, freq_1, shape);


#{
smpls_per_freq = smpl_rate / freq;
t = 0:1:smpl_N-1;
chirp_smpls = sin(2*pi*(t/smpls_per_freq));
#}

subplot(2,1,1);
hold on;
plot(chirp_smpls);
axis([0 length(chirp_smpls) -1 1]);
hold off;

subplot(2,1,2);
specgram(chirp_smpls, 256, smpl_rate);

chirp_smpls_int = int32(chirp_smpls * (2**(smpl_width - 1) - 1));
const_out = int32(2**(smpl_width - 1) - 1);
fid = fopen("freq_sweep.hex", "w");
for smpl = chirp_smpls_int
    output = [num2hex(smpl)];#, ' ', num2str(smpl)];
    #output = [num2hex(const_out)];
    fdisp(fid, substr(output, -6));
end
#fwrite(fid, int32(chirp_smpls * (2**(smpl_width - 1) - 1)), "integer*4");
#fdisp(fid, num2str(int32(chirp_smpls * (2**(smpl_width - 1) - 1))));
fclose(fid);