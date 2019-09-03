% any experiment from 1 to 7 shall have these analysis steps
function EEG = exp_analysis_core(y,conf)

EEG = import_to_eeglab(y,conf);

conf.output_dir = [conf.output_root_folder, '\', conf.exp_num];
if ~exist(conf.output_dir, 'dir')
    mkdir(conf.output_dir)
end
Plot_EEG_data(EEG, conf);
Plot_spectopo(EEG, conf);
