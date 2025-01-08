# @param {String[]} words
# @return {Integer}
def count_prefix_suffix_pairs(words)
    count = 0

    words.each_with_index do |word_1, index|
        words[(index + 1)..].each do |word_2|
            n = word_1.length
            prefix_word = word_2.slice(0, n)
            suffix_word = word_2[-n..]

            puts prefix_word
            puts suffix_word

            break if prefix_word.length < n || suffix_word.nil?

            count += 1 if word_1 == prefix_word && word_1 == suffix_word 
        end
    end

    count
end