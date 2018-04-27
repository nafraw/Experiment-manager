function index = searchDataByName(obj, names, add_missing)
if nargin < 3
    add_missing = false;
end
index = ismember(obj.nameOfData, names);
new_index = [];
if iscell(names)
    nName = numel(names);
else
    nName = size(names, 1);
end
if sum(index) < nName
    index_missing = ~ismember(names, obj.nameOfData(index));
    if nName == 1 && ~iscell(names)
        warning(['creating new index for the missing data: ', names]);
        new_index = 1 + numel(obj.data);
    else
        warning(['creating new index for the missing data: ', strjoin(names(index_missing), ', ')]);
        new_index = 1: numel(index_missing) + numel(obj.data);
    end
end
index = find(index);
if iscolumn(index)
    index = index';
end
if add_missing
    index = [index, new_index];
end
end