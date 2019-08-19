function y = load_files()
files = get_subj_cap_struct();
num_subj = length(files);
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
            eeg_file = dir(fullfile(curr_folder,'Exp*.mat'));
            for k=1:length(eeg_file)
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                y = load(curr_file);
                y = y.y;
                %% work to do with y
                mean(y);
            end
        elseif curr_dev == 'Neuroplay'
            eeg_file = dir(fullfile(curr_folder,'Exp*.edf'));
            for k=1:length(eeg_file)
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                [y,~] = readCortexData(curr_file);
                %% work to do with y
                
            end
        end
        
    end
end
end