# @param {String} s
# @param {String} t
# @param {Integer} k
# @return {Boolean}
def can_convert_string(s, t, k)
    return false unless t.length == s.length

    moves_tracker = {}

    s.length.times do |i|
        moves_needed = 0
        diff = t[i].ord - s[i].ord
        next if diff.zero?
        if diff.negative?
            additional_diff = ('z'.ord - s[i].ord) + (t[i].ord - 'a'.ord) + 1
            moves_needed += additional_diff
        else
            moves_needed += diff
        end

        moves_tracker[moves_needed] ||= 0
        moves_tracker[moves_needed] += 1
    end

    puts moves_tracker

    moves_tracker.each do |key, value|
        max_moves_needed = key + (value - 1) * 26

        return false if max_moves_needed > k
    end

    true
end