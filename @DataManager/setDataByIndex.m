function obj = setDataByIndex(obj, data, index, name)
if nargin < 4
    name = [];
end
if numel(index) ~= 1
    obj.data(index) = data;
else
    if iscell(data) && numel(data) == 1 % remove redundant cell
        obj.data{index} = data{1};
    else
        obj.data{index} = data;
    end
end
if ~isempty(name)
    if ischar(name)
        obj.nameOfData{index} = name;
    else
        obj.nameOfData(index) = name;
    end
end
obj.saveAccessTime();
end