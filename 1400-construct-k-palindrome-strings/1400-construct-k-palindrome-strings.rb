# @param {String} s
# @param {Integer} k
# @return {Boolean}
def can_construct(s, k)
    char_counts = s.chars.tally
    odds = char_counts.count { |_, value| value.odd? }

    return false if k > s.length
    return false if odds > k

    true
end