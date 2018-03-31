function obj = applyDifferentFunctionsToDataByName(obj, names, funcs)
index = obj.searchDataByName(names);
obj.applyDifferentFunctionsToDataByIndex(index, funcs);
end