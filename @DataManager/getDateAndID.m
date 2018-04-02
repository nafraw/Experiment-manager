function [id, date] = getDateAndID(obj, filename)
% the filename is assumed to follow the structure:
% id'delimiter'date'delimiter'......
[~, filename] = fileparts(filename);
[id, remaining] = strtok(filename, obj.delimiter);
date = strtok(remaining, obj.delimiter);
end