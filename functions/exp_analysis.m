function exp_analysis(y, conf)
filename_split = split(conf.name, '_');
exp_num = filename_split{1};
if strcmp(exp_num, 'Exp3')
    [EEG] = Exp3_Analysis(y, conf);
end
end