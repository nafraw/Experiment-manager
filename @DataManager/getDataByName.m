function [data, nameOfData, index] = getDataByName(obj, names)
index = obj.searchDataByName(names);
% easier to read and maintain version, but slower (need to pass
% by reference twice).
[data, nameOfData] = obj.getDataByIndex(index); % will return by cell
% a faster but more dangerous version
% data = obj.data(indices);
% nameOfData = obj.nameOfData(indices);
end