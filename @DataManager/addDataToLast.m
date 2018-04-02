function obj = addDataToLast(obj, data, names, filenames)
if nargin < 4
    filenames = ' ';
end
nDataName = checkNumel(names);
nCurrent = numel(obj.data);
obj.addData(data, names, nCurrent + (1:nDataName), filenames);
end

function nElement = checkNumel(x)
if iscell(x)
    nElement = numel(x);
else
    nElement = 1;
end
end