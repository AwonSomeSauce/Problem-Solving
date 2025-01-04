# @param {String} s
# @return {Integer}
def count_palindromic_subsequence(s)
    first_index = {}
    last_index = {}
    palindromes = 0

    s.chars.each_with_index do |char, index|
        if first_index.key?(char)
            last_index[char] = index
        else
            first_index[char] = index
        end
    end

    last_index.each do |key, value|
        palindromes += s[(first_index[key] + 1)...value].chars.uniq.length
    end

    palindromes
end