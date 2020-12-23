function str = matrix2str(A)
%MATRIX2STR Converts matrix to LaTeX-formatted string
    withoutBraces = extractAfter(regexprep(join(string(num2str(A)), "\cr"), " +", "&"), "&");
    str = join(["\left[{\matrix{" withoutBraces "}}\right]"]);
end

