%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: Min Suk Lee
% Date: 7/15/2021
% Description: Analysis LSL xdf file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

path = "C:\Users\Min\Documents\CurrentStudy\sub-P001\ses-S001\eeg";
%%% Load Data [Must Run]
filename = "sub-P001_ses-S001_task-DualStreaming Unchained.xdf";

% Extract Data from xdf file
package = load_xdf(filename); % Streams from the .xdf
numpackage = length(package); % define number of stream (i.e. eeg and accel)

%% Initialize Variables
select_package  = 1; % select the package
select_stream   = 1; % select the stream
select_channel  = 1; % select the channel. This is for single plots
stream          = package{select_package}; % get stream

Fs              = stream.info.effective_srate; % get sample rate
N               = str2num(stream.info.sample_count); % get sample number
channum         = str2num(stream.info.channel_count); % get channel count
data_Y          = double(stream.time_series); % get time series data [channum x N]
data_X          = stream.time_stamps; % get time stamp
%data_X = 0:1/Fs:(N-1)/Fs; % Assuming no data drop
savefig = false; % if saving the figures to jpg is needed
%% Trim Data
if false % true or false
    startidx = 1; % start of the data trim
    endidx = 3000; % end of the data trim
    trimrange = startidx:endidx; % create trim range
    data_Y = data_Y(:,trimrange) % new data
    data_X = data_X(trimrange) % end data
end
%% Plot Time-Series Unfiltered
figure(6);
for c = 1:channum
    subplot(channum,1,c)
    plot(data_X,data_Y(c,:))
    if c ~= channum
        set(gca,'xticklabel',[]); % remove x tick labels
    end
end
set(gcf, 'Position', get(0,'ScreenSize'))
xlabel("Time [sec]",'fontsize',12);
name = "Unfiltered Time-Series";
sgtitle(name,'fontsize',15);
if savefig
    saveas(gcf,name,'jpg')
end

%% EEGLab PSD Unfiltered
window_size = 2;
labplot(data_Y,channum,round(Fs),window_size,N) 
ylim([-200 -60])
legend;
set(gcf, 'Position', get(0, 'Screensize')); % set figure to full window
name = "Unfiltered PSD";
title(name);
if savefig
    saveas(gcf,name,'jpg')
end  
%% Spectogram Unfiltered
figure(7);
spectrogram(data_Y(select_channel,:),256,250,[],Fs,'yaxis');
set(gcf, 'Position', get(0, 'Screensize')); % set figure to full window
name = "Spectrogram, Channel " + select_channel;
title(name);
if savefig
    saveas(gcf,name,'jpg');
end
%% Apply Filter
% design 60 Hz notch filter
f1 = designfilt('bandstopiir','FilterOrder',8, ...
               'HalfPowerFrequency1',58,'HalfPowerFrequency2',62, ...
               'DesignMethod','butter','SampleRate',Fs);
%freqz(f1)
for c = 1:channum
    filterdata(c,:) = filtfilt(f1,data_Y(c,:));
end 

%% Plot Time-Series Filtered
figure;
for c = 1:channum
    subplot(channum,1,c)
    plot(data_X,filterdata(c,:))
    if c ~= channum
        set(gca,'xticklabel',[]); % remove x tick labels
    end
end
set(gcf, 'Position', get(0, 'Screensize')); % set figure to full window
xlabel("Time [sec]",'fontsize',12);
name = "Unfiltered Time-Series";
sgtitle(name,'fontsize',15);
if savefig
    saveas(gcf,name,'jpg')
end
%% EEGLab PSD Filtered
window_size = 5;
labplot(filterdata,channum,round(Fs),window_size,N) 
ylim([-200 -60])
legend;
set(gcf, 'Position', get(0, 'Screensize')); % set figure to full window
name = "Unfiltered PSD";
title(name);
if savefig
    saveas(gcf,name,'jpg')
end
%% Spectogram Filtered
figure;
spectrogram(filterdata(select_channel,:),256,250,[],Fs,'yaxis');
set(gcf, 'Position', get(0, 'Screensize')); % set figure to full window
name = "Spectrogram, Channel " + select_channel;
title(name);
if savefig
    saveas(gcf,name,'jpg');
end