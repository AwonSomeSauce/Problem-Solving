# @param {String} s
# @param {String} t
# @param {Integer} k
# @return {Boolean}
def is_possible_to_rearrange(s, t, k)
    slice_length = s.length / k
    sliced_s = s.chars.each_slice(slice_length).map(&:join)
    sliced_t = t.chars.each_slice(slice_length).map(&:join)

    sliced_s.sort == sliced_t.sort
end