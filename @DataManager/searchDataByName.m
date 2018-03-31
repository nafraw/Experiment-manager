function index = searchDataByName(obj, names)
index = ismember(obj.nameOfData, names);
if numel(index) ~= numel(names)
    index_missing = ~ismember(names, obj.nameOfData(index));
    error(['missing data: ', strjoin(names{index_missing})]);
end
end