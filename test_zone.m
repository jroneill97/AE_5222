clc; clear; close all;

amplitude = [10 9.84 7.92 7.84 3.92 1.54 1.44];
phase     = [5e-3 1.54e-3 660e-6 390e-6 228e-6 81e-6 73e-6];
frequency = [100 300 900 1000 3000 9000 10000];
PS = -atand((phase.^-1)./1300);

figure;
semilogx(frequency, 20*log10(amplitude));
hold on;
semilogx(linspace(1300,1300),linspace(0,20));
xlabel('frequency (Hz)');
ylabel('gain (dB)');
grid on
figure;
semilogx(frequency, PS);
hold on;
semilogx(linspace(1300,1300),linspace(-90,0));
xlabel('frequency (Hz)');
ylabel('phase (deg)');
grid on;