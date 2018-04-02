function obj = removeDataByName(obj, names)
index = obj.searchDataByName(names);
obj.removeDataByIndex(index);
end