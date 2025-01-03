# @param {String} s
# @param {Integer} k
# @return {Boolean}
def has_all_codes(s, k)
    binary_codes = {}
    s.length.times do |index|
        substring = s.slice(index, k)
        break if substring.length < k
        binary_codes[substring] ||= 0
        binary_codes[substring] += 1
    end

    return true if binary_codes.size.eql?(2**k)

    false
end