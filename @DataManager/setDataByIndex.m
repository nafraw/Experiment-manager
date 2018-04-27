function obj = setDataByIndex(obj, data, indices, names, filenames)
if nargin < 5
    filenames = [];
end
if nargin < 4
    names = [];
end
if numel(indices) ~= 1
    obj.data(indices) = data;
else
    if iscell(data) && numel(data) == 1 % remove redundant cell
        obj.data{indices} = data{1};
    else
        obj.data{indices} = data;
    end
end
if ~isempty(names)
    if ischar(names)
        obj.nameOfData{indices} = names;
        obj.filenames{indices} = filenames;
    else
        obj.nameOfData(indices) = names;
        obj.filenames(indices) = filenames;
    end
end
obj.saveAccessTime();
end