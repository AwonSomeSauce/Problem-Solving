# @param {Integer} n
# @param {Integer} k
# @return {String}

@count = 0

def get_happy_string(n, k)
    result = nth_happy_string(n, k, '', 0).to_s
    @count = 0

    result
end

def nth_happy_string(n, k, current_string, current_length)
    if current_length.eql?(n)
        @count += 1
        return current_string if @count.eql?(k)

        return
    end

    'abc'.each_char do |char|
        next if current_string[-1].eql?(char)

        next_string = current_string + char
        next_length = current_length + 1

        nth_string = nth_happy_string(n, k, next_string, next_length)

        return nth_string unless nth_string.nil?
    end

    nil
end
