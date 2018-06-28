function obj = setDataByName(obj, data, names, filenames, suppress_warning)
if nargin < 4
    filenames = [];
end
if nargin < 5
    suppress_warning = false;
end
index = searchDataByName(obj, names, true, suppress_warning);
obj.setDataByIndex(data, index, names, filenames);
end