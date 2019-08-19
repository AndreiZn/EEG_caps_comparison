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
br_cells = cell(2,num_sbj);
for i=1:num_sbj
    br_files = dir(fullfile(subjects(i).folder,subjects(i).name));
    dirflag = [br_files.isdir] & ~strcmp({br_files.name},'..') & ~strcmp({br_files.name},'.');
    brands = br_files(dirflag);
    brands = struct2cell(brands);
    brands = {brands{1,:}};
    br_cells{1,i} = {subjects(i).name};
    br_cells{2,i} = brands;
end
fields = {'Subjects','Devices'};
structure = cell2struct(br_cells,fields,1);
end