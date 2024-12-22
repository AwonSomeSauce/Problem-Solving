# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
    sub_string_counts = Hash.new(0)
    s.length.times do |i|
        sub_string = s.slice(i, 10)
        break if sub_string.length < 10

        sub_string_counts[sub_string] += 1
    end

    sub_string_counts.keys.reduce([]) do |acc, key|
        acc.push(key) if sub_string_counts[key] > 1
        acc
    end
end