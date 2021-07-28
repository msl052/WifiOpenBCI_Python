function [] = PSD(data,Fs)
%PSD Plotting the Power Spectral Density
%   PSD(Data(Channel,idx),Sampling Frequency)

[channum,N] = size(data);

xdft = fft(data);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/N:Fs/2;
figure;
plot(freq,10*log10(psdx))
grid on

xlim([0 100]);

ax = gca; % get handle to the axes graphical object
ax.XAxis.FontSize = 12;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontSize = 12;
ax.YAxis.FontWeight = 'bold';

title('Periodogram Using FFT','FontWeight', 'bold','FontSize',19)
xlabel('Frequency (Hz)','FontWeight', 'bold','FontSize',19)
ylabel('Power/Frequency (dB/Hz)','FontWeight', 'bold','FontSize',19)


end

