# @param {Integer} num
# @return {String}
def int_to_roman(num)
    integers_to_symbols = {
        1000 => 'M',
        900 => 'CM',
        500 => 'D',
        400 => 'CD',
        100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
        9 => 'IX',
        5 => 'V',
        4 => 'IV',
        1 => 'I'
    }.freeze

    symbol = ''

    while num.positive?
        integers_to_symbols.each do |key, value|
        if key <= num
            symbol += value
            num -= key
            break
        end
        end
    end

    symbol
end