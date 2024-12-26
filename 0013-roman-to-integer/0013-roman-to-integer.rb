# @param {String} s
# @return {Integer}
def roman_to_int(s)
    symbol_to_integers = {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000
    }

    roman_integer = 0
    chars = s.chars

    chars.each_with_index do |char, index|
        if index < chars.length - 1 && symbol_to_integers[chars[index + 1]] > symbol_to_integers[char]
            roman_integer -= symbol_to_integers[char]
        else
            roman_integer += symbol_to_integers[char]
        end
    end

    roman_integer
end