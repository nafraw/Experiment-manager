function obj = applyDifferentFunctionsToAllData(obj, funcs)
index = 1: numel(funcs);
obj.applyDifferentFunctionsToDataByIndex(index, funcs);
end