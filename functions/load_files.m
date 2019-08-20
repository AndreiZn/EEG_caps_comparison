function y = load_files()
files = get_subj_cap_struct();
num_subj = length(files);
time_step_to_plot = 5;
%% iterate over subjects
for i=1:num_subj
    subj = files(i).Subject;
    devices = files(i).Devices;
    root_addr = files(i).Root_Addr;
    fprintf('Current subject name is: %s \n',subj{1});
    %% iterate over devices
    for j=1:length(devices)
        curr_dev = devices{j};
        fprintf('\t\tCurrent device is: %s\n', curr_dev);
        curr_folder = fullfile(root_addr,curr_dev);
        %% select device type
        if curr_dev == 'gNautilus'
            sampling_rate = 250;
            time_period_to_remove = 20;
            channel_location_file = 'C:\Users\user.T440_IT\EEG_caps_comparison_main\EEG_caps_comparison_code\eeglab14_1_2b\sample_locs\gGAMMAcap8ch_10-20.locs';
            eeg_file = dir(fullfile(curr_folder,'Exp*.mat'));
            for k=1:length(eeg_file)
                fprintf('\t\t\t\tCurrent file is: %s\n', eeg_file(k).name);
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                y = load(curr_file);
                y = y.y;
                y = y(:,sampling_rate*time_period_to_remove:end);
                %% work to do with y
                filename_split = split(eeg_file(k).name, '_');
                exp_num = filename_split{1};
                if strcmp(exp_num, 'Exp3')
                    [EEG] = Exp3_Analysis(y, sampling_rate, channel_location_file, time_step_to_plot);
                end
            end
        elseif curr_dev == 'Neuroplay'
            eeg_file = dir(fullfile(curr_folder,'Exp*.edf'));
            for k=1:length(eeg_file)
                fprintf('\t\t\t\tCurrent file is: %s\n', eeg_file(k).name);
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                [y,~] = readCortexData(curr_file);
                %% work to do with y
                
            end
        end
        
    end
end
end