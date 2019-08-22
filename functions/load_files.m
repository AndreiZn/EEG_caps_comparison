function y = load_files()
files = get_subj_cap_struct();
num_subj = length(files);
conf_lb = {'name','sampling_rate','channel_location_file','time_step_to_plot',...
    'subject','curr_dev','curr_folder'};
c= cell(length(conf_lb),1);
conf = cell2struct(c,conf_lb);
conf.time_step_to_plot = 5;
%% iterate over subjects
for i=1:num_subj
    subj = files(i).Subject;
    conf.subject = subj{1};
    devices = files(i).Devices;
    root_addr = files(i).Root_Addr;
    fprintf('Current subject name is: %s \n',conf.subject);
    %% iterate over devices
    for j=1:length(devices)
        conf.curr_dev = devices{j};
        fprintf('\t\tCurrent device is: %s\n', conf.curr_dev);
        conf.curr_folder = fullfile(root_addr,conf.curr_dev);
        %% select channel location file
        fprintf('Choose channel location file for %s ....',conf.curr_dev);
        [name,path] = uigetfile({'*.ced;*.locs'},'Pick channel location file ...');
        fprintf('%s selected.... Done!',name);
        conf.channel_location_file = fullfile(path,name);
        %% select device type
        if conf.curr_dev == 'gNautilus'
            conf.sampling_rate = 250;
            conf.time_period_to_remove = 20;
            eeg_file = dir(fullfile(conf.curr_folder,'Exp*.mat'));
            for k=1:length(eeg_file)
                conf.name = eeg_file(k).name;
                fprintf('\t\t\t\tCurrent file is: %s\n', conf.name);
                conf.curr_file = fullfile(conf.curr_folder,conf.name);
                y = load(conf.curr_file);
                y = y.y;
                y = y(:,conf.sampling_rate*conf.time_period_to_remove:end);
                %% work to do with y
                exp_analysis(y,conf);
            end
        elseif conf.curr_dev == 'Neuroplay'
            conf.sampling_rate = 125;
            conf.time_period_to_remove = 20;
            eeg_file = dir(fullfile(conf.curr_folder,'Exp*.edf'));
            for k=1:length(eeg_file)
                conf.name = eeg_file(k).name;
                fprintf('\t\t\t\tCurrent file is: %s\n', conf.name);
                conf.curr_file = fullfile(conf.curr_folder,conf.name);
                [y,~] = readCortexData(conf.curr_file);
                y = y(:,conf.sampling_rate*conf.time_period_to_remove:end);
                %% work to do with y
                exp_analysis(y,conf);
                
            end
        end
        
    end
end
end