function obj = setDataByName(obj, data, name)
index = searchDataByName(obj, name);
obj.setDataByIndex(data, index);
end