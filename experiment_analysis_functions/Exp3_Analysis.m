% Analysis of Experiment 3 (a subject was instructed to press the left mouse button whenever 
% a red circle appeared on the screen)
% function [EEG] = Exp3_Analysis(y, srate, channel_location_file, time_step_to_plot)
function [EEG] = Exp3_Analysis(y,conf)

srate = conf.sampling_rate;
assignin('base','y',y)
assignin('base','srate',srate)

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
EEG = pop_importdata('dataformat','array','nbchan',9,'data','y','srate',srate,'pnts',0,'xmin',0);
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG,'channel',2:9);
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'chanlocs', conf.channel_location_file);
EEG = eeg_checkset( EEG );
eegplot('noui',EEG.data, 'winlength', size(y,2)/srate, 'eloc_file', conf.channel_location_file);
fig = gcf;
chldrn = fig.Children; 
ax = chldrn(3);
xticks(ax, 1:srate*conf.time_step_to_plot:size(y,2));
saveas(fig,'Exp3_Plot.png')
close(gcf)


% 
% %[spectopo_outputs] = pop_spectopo( EEG, dataflag, timerange, process, 'key', 'val',...); % returns spectopo() outputs
% 
% %output_set_name = [set_name, '_', output_suffix, '.set'];
% %EEG = pop_saveset( EEG, 'filename',output_set_name,'filepath',output_folder_cur);
% %EEG = eeg_checkset( EEG );
