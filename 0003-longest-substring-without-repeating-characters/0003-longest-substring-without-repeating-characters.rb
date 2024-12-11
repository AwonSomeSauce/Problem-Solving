# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    current_length = 0
    maximum_length = 0
    last_processed_index = -1
    seen = {}

    s.chars.each_with_index do |char, index|
        if seen.key?(char) && seen[char] > last_processed_index
        current_length = index - seen[char]
        last_processed_index = seen[char]
        else
        current_length += 1
        end

        seen[char] = index
        maximum_length = current_length > maximum_length ? current_length : maximum_length
    end

    maximum_length
end