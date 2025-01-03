# @param {String[]} words
# @return {Integer}
def longest_palindrome(words)
    palindrome_length = 0
    pure_strings = words.select { |word| word.eql?(word.reverse) }.tally
    non_pure_strings = words.reject { |word| word.eql?(word.reverse) }.tally

    non_pure_strings.each do |string, freq|
        if non_pure_strings.key?(string.reverse)
            pairs = [freq, non_pure_strings[string.reverse]].min
            palindrome_length += pairs * 4
            non_pure_strings[string] -= pairs
            non_pure_strings[string.reverse] -= pairs
        end
    end

    pure_strings.each do |string, freq|
        if freq.even?
            palindrome_length += freq * 2
            pure_strings[string] = 0
            next
        end

        palindrome_length += (freq - 1) * 2 if freq > 1
        pure_strings[string] = 1
    end

    palindrome_length += 2 if pure_strings.any? { |_, value| value.eql?(1) }
    palindrome_length
end