function [data, nameOfData, index] = getDataByName(obj, names)
index = obj.searchDataByName(names);
% easier to read and maintain version, but slower (need to pass
% by reference twice).
[data, nameOfData] = obj.getDataByIndex(index); % will return by cell
if numel(data) == 1 % make output non-cell when possible
    data = data{1};
    nameOfData = nameOfData{1};
end
% a faster but more dangerous version
% data = obj.data(indices);
% nameOfData = obj.nameOfData(indices);
end