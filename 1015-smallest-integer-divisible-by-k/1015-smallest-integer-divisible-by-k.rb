# @param {Integer} k
# @return {Integer}
def smallest_repunit_div_by_k(k)
    loop_count = 0
    remainder = 1
    length = 1

    while loop_count < k
        return length if (remainder % k).zero?

        remainder = (((remainder % k) * (10 % k)) % k + 1) % k
        loop_count += 1
        length += 1
    end

    -1
end