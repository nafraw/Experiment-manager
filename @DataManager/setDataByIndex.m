function obj = setDataByIndex(obj, data, index)
if numel(index) ~= 1
    obj.data(index) = data;
else
    if iscell(data) && numel(data) == 1 % remove redundant cell
        obj.data{index} = data{1};
    else
        obj.data{index} = data;
    end
end
obj.saveAccessTime();
end