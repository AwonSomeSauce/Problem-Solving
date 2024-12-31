# @param {String[]} wordlist
# @param {String[]} queries
# @return {String[]}
def mask_vowels(s)
    s.each_char.map { |char| 'aeiouAEIOU'.include?(char) ? ' ' : char }.join
end

def spellchecker(wordlist, queries)
    lowercase_words = {}
    vowel_less_words = {}
    answers = []

    wordlist.each do |word|
        downcased_word = word.downcase
        lowercase_words[downcased_word] = word unless lowercase_words.key?(word.downcase)
        vowel_less_words[mask_vowels(downcased_word)] = word unless vowel_less_words.key?(mask_vowels(downcased_word))
    end

    queries.each do |query|
        if wordlist.include?(query)
            answers << query
        elsif lowercase_words.key?(query.downcase)
            answers << lowercase_words[query.downcase]
        elsif vowel_less_words.key?(mask_vowels(query.downcase))
            answers << vowel_less_words[mask_vowels(query.downcase)]
        else
            answers << ''
        end
    end

    answers
end
