# @param {String} s
# @return {Integer}
def num_splits(s)
    char_counts = {}
    chars_processed = {}
    uniq_chars = 0
    uniq_chars_processed = 0
    good_split_count = 0

    s.each_char do |char|
        unless char_counts.key?(char)
            char_counts[char] = 0
            uniq_chars += 1
        end
        char_counts[char] += 1
    end

    s.each_char do |char|
        unless chars_processed.key?(char)
            chars_processed[char] = 0
            uniq_chars_processed += 1
        end
        chars_processed[char] += 1
        uniq_chars -= 1 if chars_processed[char] == char_counts[char]
        good_split_count += 1 if uniq_chars == uniq_chars_processed
    end

    good_split_count
end
