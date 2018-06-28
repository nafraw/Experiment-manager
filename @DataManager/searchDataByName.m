function index = searchDataByName(obj, names, add_missing, suppress_warning)
if nargin < 3
    add_missing = false;
end
if nargin < 4
    suppress_warning = false;
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
        if ~suppress_warning
            warning(['creating new index for the missing data: ', names]);
        end
        new_index = 1 + numel(obj.data);
    else
        if ~suppress_warning
            warning(['creating new index for the missing data: ', strjoin(names(index_missing), ', ')]);
        end
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