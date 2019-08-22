% Analysis of Experiment 2 (a subject was instructed to sit still for ~3 minutes with open eyes and look at the cross in the center of the screen)
function Exp2_Analysis(y,conf)

srate = conf.sampling_rate;
assignin('base','y',y)
assignin('base','srate',srate)

EEG = pop_importdata('dataformat','array','nbchan',9,'data','y','srate',srate,'pnts',0,'xmin',0);
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG,'channel',2:9);
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'chanlocs', conf.channel_location_file);
EEG = eeg_checkset( EEG );
conf.output_dir = [conf.output_root_folder, '\', conf.exp_num];
if ~exist(conf.output_dir, 'dir')
    mkdir(conf.output_dir)
end
Plot_EEG_data(EEG, conf);
