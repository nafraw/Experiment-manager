function obj = addDataToLast(obj, data, names, filenames)
if nargin < 4
    filenames = ' ';
end
nData = checkNumel(data);
nCurrent = numel(obj.data);
obj.addData(data, names, nCurrent + (1:nData), filenames);
end

function nElement = checkNumel(x)
if iscell(x)
    nElement = numel(x);
else
    nElement = 1;
end
end