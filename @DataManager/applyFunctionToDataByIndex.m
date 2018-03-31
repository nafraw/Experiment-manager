function obj = applyFunctionToDataByIndex(obj, indices, func)
for idx = indices
    func(obj.dat(idx));
end
obj.saveAccessTime();
end