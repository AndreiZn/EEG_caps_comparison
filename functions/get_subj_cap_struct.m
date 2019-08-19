function structure = get_subj_cap_struct()
%% getting root folder
root_add = uigetdir('./','Select root folder...');

%% get structure of root folder (list of subjects)
files = dir(root_add);
dirflag = [files.isdir] & ~strcmp({files.name},'..') & ~strcmp({files.name},'.');
subjects = files(dirflag);

%% subject analyzing
num_sbj = length(subjects);

%% brand analizing
br_cells = cell(num_sbj,1);
for i=1:num_sbj
    br_files = dir(fullfile(subjects(i).folder,subjects(i).name));
    dirflag = [br_files.isdir] & ~strcmp({br_files.name},'..') & ~strcmp({br_files.name},'.');
    brands = br_files(dirflag);
    brands = struct2cell(brands);
    brands = {brands{1,:}};
    br_cells{i} = brands;
end
fields = struct2cell(subjects);
fields = {fields{1,:}};
structure = cell2struct(br_cells,fields,1);
end