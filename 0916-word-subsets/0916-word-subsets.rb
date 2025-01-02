# @param {String[]} words1
# @param {String[]} words2
# @return {String[]}
def word_subsets(words1, words2)
    max_char_frequency = {}
    universal_words = []

    words2.each do |word|
        char_frequency = {}
        word.each_char do |char|
        char_frequency[char] ||= 0
        char_frequency[char] += 1

        max_char_frequency[char] ||= 0
        max_char_frequency[char] = [max_char_frequency[char], char_frequency[char]].max
        end
    end

    words1.each do |word|
        char_frequency = word.chars.tally
        universal = true
        max_char_frequency.each do |char, value|
            if !char_frequency.key?(char) || (char_frequency[char] < max_char_frequency[char])
                universal = false
                break
            end
        end

        universal_words << word if universal
    end

    universal_words
end