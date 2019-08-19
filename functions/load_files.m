function y = load_files()
files = get_subj_cap_struct();
num_subj = length(files);
for i=1:num_subj
    subj = files(i).Subject;
    devices = files(i).Devices;
    root_addr = files(i).Root_Addr;
    fprintf('Current subject name is: %s \n',subj);
    for j=1:length(devices)
        curr_dev = devices(j);
        fprintf('\t\tCurrent device is: %s\n', curr_dev);
        curr_folder = fullfile(root_addr,curr_dev);
        if curr_dev == 'gNautilus'
            eeg_file = dir(fullfile(curr_folder,'Exp*.edf'));
            for k=1:length(eeg_file)
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                [y,~] = readCortexData(curr_file);
            end
        elseif curr_dev == 'Neuroplay'
            eeg_file = dir(fullfile(curr_folder,'Exp*.edf'));
            for k=1:length(eeg_file)
                curr_file = fullfile(curr_folder,eeg_file(k).name);
                y = load(curr_file);
                y = y.y;
            end
        end
        
    end
end
end