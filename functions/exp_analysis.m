function exp_analysis(y, conf)
filename_split = split(conf.name, '_');
exp_num = filename_split{1};
conf.exp_num = exp_num(1:4);
if strcmp(conf.exp_num, 'Exp1')
    Exp1_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp2')
    Exp2_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp3')
    Exp3_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp4')
    Exp4_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp5')
    Exp5_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp6')
    Exp6_Analysis(y, conf);
end
if strcmp(conf.exp_num, 'Exp7')
    Exp7_Analysis(y, conf);
end
end