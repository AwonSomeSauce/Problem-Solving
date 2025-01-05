# @param {String} s
# @param {Integer[][]} shifts
# @return {String}
def shifting_letters(s, shifts)
    total_shifts = {}
    (s.length + 1).times { |i| total_shifts[i] = 0 }

    shifts.each do |shift|
        if shift[2].eql?(0)
            total_shifts[shift[0]] -= 1
            total_shifts[shift[1] + 1] += 1
        else
            total_shifts[shift[0]] += 1
            total_shifts[shift[1] + 1] -= 1
        end
    end

    total_shifts.each_key do |key|
        next if key.zero?
        total_shifts[key] += total_shifts[key - 1]
    end

    s.length.times do |index|
        moves = total_shifts[index] % 26
        s[index] = (((s[index].ord - 'a'.ord + moves) % 26) + 'a'.ord).chr
    end

    s
end