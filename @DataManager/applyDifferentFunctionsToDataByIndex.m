function obj = applyDifferentFunctionsToDataByIndex(obj, indices, funcs)
assert(numel(indices) == numel(funcs));
for fidx = 1: numel(funcs)
    idx = indices(fidx);
    funcs{fidx}(obj.data{idx});
end
obj.saveAccessTime();
end