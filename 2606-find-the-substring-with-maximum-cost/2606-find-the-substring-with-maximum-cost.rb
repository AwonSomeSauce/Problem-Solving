# @param {String} s
# @param {String} chars
# @param {Integer[]} vals
# @return {Integer}
def maximum_cost_substring(s, chars, vals)
    char_strengths = {}
    max_sum_at = []
    maximum_cost = 0
    cost_so_far = 0

    (1..26).each do |i|
        char = (96 + i).chr
        char_strengths[char] = chars.include?(char) ? vals[chars.index(char)] : i
    end

    s.chars.each_with_index do |char, index|
        max_sum = [(index.zero? ? 0 : max_sum_at[index - 1]) + char_strengths[char], char_strengths[char]].max
        max_sum_at << max_sum
        maximum_cost = [max_sum, maximum_cost].max
    end

    maximum_cost
end