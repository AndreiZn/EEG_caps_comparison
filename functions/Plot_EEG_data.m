function Plot_EEG_data(EEG, conf)
srate = EEG.srate;
regular_spacing = max(mean(EEG.data,2) + 6*std(EEG.data,[],2));
extreme_case_spacing = 1000; % microvolts
spacing = min([regular_spacing, extreme_case_spacing]);
eegplot('noui', EEG.data, 'winlength', size(EEG.data,2)/srate, 'srate', srate, 'spacing', spacing, 'eloc_file', conf.channel_location_file);
fig = gcf;
chldrn = fig.Children;
ax_idx = 4; % usually works, but unstable
for i=1:numel(chldrn)
    if isa(chldrn(i),'matlab.graphics.axis.Axes') && ~isempty(chldrn(i).UserData)
        ax_idx = i;
    end
end
ax = chldrn(ax_idx);
xticks(ax, 0:srate*conf.time_step_to_plot:size(EEG.data,2));
xticklabels(ax, 0:conf.time_step_to_plot:size(EEG.data,2)/srate);
grid on;
saveas(fig,[conf.output_dir, '\', conf.subject,'_',conf.curr_dev,'_', conf.exp_num, '_plot','.png'])
close(gcf)