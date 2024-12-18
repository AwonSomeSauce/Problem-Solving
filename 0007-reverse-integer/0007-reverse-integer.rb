# @param {Integer} x
# @return {Integer}
def reverse(x)
    top_val = 2147483647
    bot_val = -2147483648
    negative = false
    if x < 0
        negative = true 
        x *= -1
    end
    x_string = x.to_s
    x_string.reverse!
    x_int = x_string.to_i
    x_int *= -1 if negative == true
    
    return 0 if x_int < bot_val || x_int > top_val

    x_int
end