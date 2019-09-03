function EEG = import_to_eeglab(y,conf)

srate = conf.sampling_rate;
assignin('base','y',y)
assignin('base','srate',srate)

EEG = pop_importdata('dataformat','array','nbchan',9,'data','y','srate',srate,'pnts',0,'xmin',0);
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG,'channel',2:9);
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'chanlocs', conf.channel_location_file);
EEG = eeg_checkset( EEG );
[EEG, ~, ~, ~] = pop_rejchan(EEG,'elec',1:EEG.nbchan,'threshold',1.5,'norm','on','measure','kurt');
EEG = pop_rejchan(EEG, 'elec',1:EEG.nbchan,'threshold',2,'norm','on','measure','spec','freqrange',[1 62.5]);