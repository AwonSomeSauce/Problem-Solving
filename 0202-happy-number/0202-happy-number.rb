# @param {Integer} n
# @return {Boolean}
def is_happy(n)
    numbers_processed = Hash.new(false)
    while n > 1
        n_string = n.to_s
        sum_of_square = n_string.chars.reduce(0) { |acc, char| acc + (char.to_i**2) }
        n = sum_of_square
        return false if numbers_processed.key?(n)

        numbers_processed[n] = true
    end

    true
end