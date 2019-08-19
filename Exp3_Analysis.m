% % Analysis of Experiment 3 (a subject was instructed to press the left mouse button whenever 
% % a red circle appeared on the screen)
% 
% disk_prefix = 'K';
% 
% data_root_folder = [disk_prefix, ':\Users\user.T440_IT\EEG_caps_comparison_main\EEG_caps_comparison_data\'];
% electrode_location_file = [disk_prefix, ':\Users\user.T440_IT\EEG_caps_comparison_main\EEG_caps_comparison_code\eeglab14_1_2b\sample_locs\'];
% output_folder = [disk_prefix, ':\Users\user.T440_IT\EEG_caps_comparison_main\EEG_caps_comparison_code\'];
% subject_name = 'Ali';
% device_name = 'gNautilus';
% file_name = ['Exp3_EEG_cap_comparison.mat'];
% set_name = ['ds_', subject_name, '_', device_name, '_', 'Exp3'];
% sampling_rate = 250; % Hz
% 
% EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
% exp_file_path = [data_root_folder, subject_name, '\', device_name, '\', file_name];
% EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',exp_file_path,'setname',set_name,'srate',sampling_rate,'pnts',0,'xmin',0);
% EEG = eeg_checkset( EEG );
% EEG = pop_select( EEG,'channel',2:9);
% EEG = eeg_checkset( EEG );
% EEG = pop_editset(EEG, 'chanlocs', electrode_location_file);
% EEG = eeg_checkset( EEG );
% 
% [spectopo_outputs] = pop_spectopo( EEG, dataflag, timerange, process, 'key', 'val',...); % returns spectopo() outputs
% 
% %output_set_name = [set_name, '_', output_suffix, '.set'];
% %EEG = pop_saveset( EEG, 'filename',output_set_name,'filepath',output_folder_cur);
% %EEG = eeg_checkset( EEG );
