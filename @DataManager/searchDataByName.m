function index = searchDataByName(obj, names)
index = ismember(obj.nameOfData, names);
 if iscell(names)
     nName = numel(names);
 else
     nName = size(names, 1);
 end
if sum(index) < nName
    index_missing = ~ismember(names, obj.nameOfData(index));
    error(['missing data: ', strjoin(names{index_missing})]);
end
index = find(index);
end