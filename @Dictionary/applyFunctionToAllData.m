function obj = applyFunctionToAllData(obj, func)
index = 1: numel(obj.data);
obj.applyFunctionToDataByIndex(index, func);
end