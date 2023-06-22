syms t;

a1 = 3;
a2 = 5;
a3 = 7;
f1 = 11;
f2 = 13;
f3 = 17;




x = a1 .* cos(2 .* pi .* f1 .* t) ...
    + a2 .* cos(2 .* pi .* f2 .* t) ...
    + a3 .* cos(2 .* pi .* f3 .* t);

figure(1);
fplot(x);
xlim([0,1]);
ylim([-16,16]);




Fs = 2000;
t_samp = 0 : 1/Fs : 1;
x_samp = a1 .* cos(2 .* pi .* f1 .* t_samp) ...
    + a2 .* cos(2 .* pi .* f2 .* t_samp) ...
    + a3 .* cos(2 .* pi .* f3 .* t_samp);

n1 = length(x_samp);
y1 = fft(x_samp, n1);

fdouble = (-n1 / 2 : n1 / 2 - 1) * (Fs / n1);
ydouble = fftshift(abs(y1)) / n1;

figure(2);
plot(fdouble, ydouble, 'b');
xlabel('frequency (Hz)');
xlim([-20,20]);




fsingle = ( 0 : (n1 - 1) / 2 ) * (Fs / n1);
ysingle = abs(y1(1 : (n1 + 1) / 2)) / n1;
ysingle(2 : end) = 2 * ysingle (2 : end);


figure(3);
plot(fsingle, abs(ysingle), 'b');
xlabel('frequency (Hz)');
xlim([-20,20]);







Y = ifft(y1);
figure(4);
plot(t_samp, Y, 'b');
