# @param {String[]} start_words
# @param {String[]} target_words
# @return {Integer}
def word_count(start_words, target_words)
    count = 0
    previous_words = start_words.map{ |a| a.chars.sort.join }.tally

    target_words.each do |word|
        word.length.times do |i|
            sorted_word = word.chars.sort.join
            modified_word = sorted_word[0...i] + sorted_word[(i + 1)..]
            if previous_words.key?(modified_word)
                count += 1
                break
            end
        end
    end

    count
end