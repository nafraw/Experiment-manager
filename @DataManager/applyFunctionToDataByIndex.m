function obj = applyFunctionToDataByIndex(obj, indices, func)
for idx = indices
    func(obj.data{idx});
end
obj.saveAccessTime();
end