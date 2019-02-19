function out = dirType(typeToKeep, searchString)
%%%%% Only keep the files or the directories from a dir() call
%%%%% Written by Carol Jew (January 10, 2018)
%%%%% Input:
%%%%%   required:
%%%%%       typeToKeep: string('dir' or 'file'); keep only the directories or the files
%%%%%       found by dir()
%%%%%   optional:
%%%%%       searchString: string; look for items within the directory that
%%%%%       match this criteria (default: all files/directories)
%%%%% Output: structure of found files or directories matching criteria

    if nargin == 2
        out = dir(searchString);
    else
        out = dir();
    end
    
    out(strncmp({out.name}, '.', 1)) = [];

    if nargin >= 1
        if strcmp(typeToKeep, 'dir')
            out(~[out(:).isdir]) = [];
        elseif strcmp(typeToKeep, 'file')
            out([out(:).isdir]) = [];
        else
            error('Need to specify what type of entry you are looking for within the directory, either ''dir'' for directories or ''file'' for files.');
        end
    end
end
