function obj = applyFunctionToDataByIndex(obj, indices, func)
for idx = indices
    obj.data{idx} = func(obj.data{idx});
end
obj.saveAccessTime();
end