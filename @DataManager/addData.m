function obj = addData(obj, data, names, indices, filenames)
if nargin < 5
    if isempty(obj.filenames)
        filenames = ' ';
    else
        filenames = obj.filenames{1};
    end
end
% Determine number of data
nData = checkNumel(data);
nFilenames = checkNumel(filenames);
nNames = checkNumel(names);
nIdx = numel(indices);

if nFilenames == 1 && nData ~= 1
    % duplicate filenames if only one was provided and nData is
    % multiple.
    filenames = repmat(filenames, nData, 1);
    filenames = mat2cell(filenames, ones(nData, 1));
else
    % check consistency
    assert(nData == nFilenames);
end
% Check consistency of arguments
assert(nData == nNames);
assert(nNames == nIdx);
% Assign Data
if nIdx == 1
    obj.data{indices} = data;
    obj.nameOfData{indices} = names;
    obj.filenames{indices} = filenames;
else
    obj.data(indices) = data;
    obj.nameOfData(indices) = names;
    obj.filenames(indices) = filenames;
end
% Check
if obj.checkRoutine
    obj.checkData
end
obj.saveAccessTime();
end

function nElement = checkNumel(x)
if iscell(x)
    nElement = numel(x);
else
    nElement = 1;
end
end