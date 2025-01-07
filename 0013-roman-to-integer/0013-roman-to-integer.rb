# @param {String} s
# @return {Integer}
def roman_to_int(s)
    symbol_to_value = {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000
    }.freeze

    value = 0

    s.chars.each_with_index do |char, index|
        current_value = symbol_to_value[s[index]]

        if index == s.length - 1
            value += current_value
            break
        end

        next_value = symbol_to_value[s[index + 1]]

        if current_value < next_value
            value -= current_value
        else
            value += current_value
        end

        puts value
    end

    value
end