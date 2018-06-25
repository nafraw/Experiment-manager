function obj = setDataByName(obj, data, names, filenames, surpress_warning)
if nargin < 4
    filenames = [];
end
if nargin < 5
    surpress_warning = false;
end
index = searchDataByName(obj, names, true, surpress_warning);
obj.setDataByIndex(data, index, names, filenames);
end