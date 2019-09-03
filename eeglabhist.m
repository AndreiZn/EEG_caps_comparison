% EEGLAB history file generated on the 03-Sep-2019
% ------------------------------------------------

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
EEG = pop_importdata('dataformat','array','nbchan',0,'data','y','srate',125,'pnts',0,'xmin',0);
EEG.setname='ds';
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG,'channel',[2:9] );
EEG = eeg_checkset( EEG );
EEG = pop_loadset('filename','demo_ds.set','filepath','D:\\EEG_caps_comparison_main\\EEG_caps_comparison_code\\');
EEG = eeg_checkset( EEG );
EEG = pop_rejchan(EEG, 'elec',[1:8] ,'threshold',2,'norm','on','measure','spec','freqrange',[1 62.5] );
