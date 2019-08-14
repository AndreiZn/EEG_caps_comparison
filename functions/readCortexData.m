function [records,hdr] = readCortexData(addr)
%% begin function
% addr: address to the .edf file
% records: recorded data extracted from .edf file concatenated with time
% stamps
% hdr: the structor extracted from .edf file
[readhdr, readrecords] = edfread(addr);
smplr = readhdr.frequency(1);
duration = readhdr.records;
timestep = 1/smplr;
time_st = 0:timestep:duration;
records = vertcat(time_st(1:end-1),readrecords(1:end-1,:));
hdr = readhdr;
end