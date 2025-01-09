# @param {String[]} words
# @param {String} pref
# @return {Integer}
def prefix_count(words, pref)
    n = pref.length

    words.count { |word| word.slice(0, n).eql?(pref) }
end