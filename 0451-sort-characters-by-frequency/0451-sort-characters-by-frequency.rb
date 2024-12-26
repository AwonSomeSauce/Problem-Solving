# @param {String} s
# @return {String}
def frequency_sort(s)
    char_count = Hash.new(0)
    sorted_string = ''
    s.each_char { |char| char_count[char] += 1 }
    char_count = char_count.sort_by { |_, count| -count }.to_h
    char_count.each do |char, count|
        sorted_string += char * count
    end
    sorted_string
end