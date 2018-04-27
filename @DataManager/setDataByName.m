function obj = setDataByName(obj, data, names, filenames)
if nargin < 4
    filenames = [];
end
index = searchDataByName(obj, names);
obj.setDataByIndex(data, index, names, filenames);
end