# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
    longest_chain_count = 1
    words_dictionary = {}
    words.each { |word| words_dictionary[word] = 1 }
    words.sort! { |a, b| a.length <=> b.length }
    words.each do |word|
        word.chars.each_with_index do |_, index|
            sliced_word = word[0...index] + word[(index + 1)..]
            next unless words_dictionary.key?(sliced_word)

            if words_dictionary[word] < words_dictionary[sliced_word] + 1
                words_dictionary[word] = words_dictionary[sliced_word] + 1
                longest_chain_count = [longest_chain_count, words_dictionary[word]].max
            end
        end
    end

    longest_chain_count
end