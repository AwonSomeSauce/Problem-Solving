# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    anagrams = []
    anagrammed_groups = {}
    strs.each do |str|
        sorted_str = str.chars.sort.join
        if anagrammed_groups.key?(sorted_str)
        anagrammed_groups[sorted_str].append(str)
        else
        anagrammed_groups[sorted_str] = [str]
        end
    end

    anagrammed_groups.each do |key, value|
        anagrams.append(value)
    end

    anagrams
end