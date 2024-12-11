# @param {String} s
# @return {Boolean}
def is_valid(s)
    char_stack = []
    s.chars.each do |char|
        case char
        when ')'
        return false if char_stack.pop != '('
        when ']'
        return false if char_stack.pop != '['
        when '}'
        return false if char_stack.pop != '{'
        else
        char_stack.push(char)
        end
    end

    return false unless char_stack.empty?
    
    true
end