function obj = applyFunctionToDataByName(obj, names, func)
index = obj.searchDataByName(names);
obj.applyFunctionToDataByIndex(index, func);
end