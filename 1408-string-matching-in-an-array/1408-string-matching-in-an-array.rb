# @param {String[]} words
# @return {String[]}
def string_matching(words)
    substrings = []

    words.sort! { |a, b| a.length <=> b.length }
    words.each_with_index do |word_1, index|
        words[(index + 1)..].each do |word_2|
            if word_2.include?(word_1)
                substrings << word_1
                break
            end
        end
    end

    substrings
end