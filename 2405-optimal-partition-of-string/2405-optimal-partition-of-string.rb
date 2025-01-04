# @param {String} s
# @return {Integer}
def partition_string(s)
    char_freq = s.chars.tally
    char_freq = char_freq.sort_by { |_, value| -value }
    char_freq.first.last
end