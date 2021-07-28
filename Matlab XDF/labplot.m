function [] = labplot(data,numchans,Fs,win_size,N)
%LABPLOT Summary of this function goes here
%   data,number of channels, sampling frequencies, window size
    EEG = pop_importdata('data', data, 'nbchan', numchans, 'srate', Fs);

    time_plt(1) = 0*EEG.srate;
    time_plt(2) = N*EEG.srate;

    time_plt(1)/EEG.srate;
    time_plt(2)/EEG.srate;
    timerange
    toplot = 'OFF';       %** Turn Plot ON or OFF
    freqs_plt = [0 100];
    SIGTMP = EEG.data; 
    totsiz = EEG.pnts;

    SIGTMP = reshape(SIGTMP, size(SIGTMP,1), size(SIGTMP,2)*size(SIGTMP,3));
    [spectra, freqs] = spectopo(SIGTMP, totsiz, EEG.srate, ...
    'freqrange', freqs_plt, ...
    'winsize', Fs*win_size, ...
    'limits', [0 60 NaN NaN], ... %xmin xmax ymin ymax
    'plot', toplot);

    figure;
    plot(freqs, spectra,'LineWidth',2); 
    box on
    set(gca,'FontSize',14);
    set(gca,'LineWidth',2);
    xlabel('Frequency [Hz]','FontWeight', 'bold','FontSize',15);
    ylabel('Log Power Spectral Density [10*log_{10}(\muV^{2}/Hz)]','FontWeight', 'bold','FontSize',12);
%     lgd = legend(EC_LEGEND,'Interpreter','none');
%     lgd.FontSize = 15;
%     lgd.FontWeight = 'bold';
%     lgd.Location = 'northwest';
%    ylim([-140 -10]);
    xlim([1 125]);
end

