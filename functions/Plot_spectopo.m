function Plot_spectopo(EEG, conf)

epoch_boundary = [1, EEG.xmax*1000]; % ms
figure('Renderer', 'painters', 'Position', [10 10 1200 800])
[~, ~] = pop_spectopo(EEG, 1, epoch_boundary, 'EEG','electrodes','on', 'freqrange', [1 50]);
fig = gcf;
%chldrn = fig.Children; 
n_ch = size(EEG.chanlocs,2);
ch_label = cell(1, n_ch);
for i=1:n_ch
    ch_label{i} = EEG.chanlocs(i).labels;
end
legend(EEG.chanlocs.labels)
saveas(fig,[conf.output_dir, '\', conf.subject,'_',conf.curr_dev,'_', conf.exp_num, '_spectopo_plot','.png'])
close(gcf)