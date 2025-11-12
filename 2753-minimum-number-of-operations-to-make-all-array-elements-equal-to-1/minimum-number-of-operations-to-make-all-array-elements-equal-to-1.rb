# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    return (nums.length - nums.count(1)) if nums.include?(1)

    shortest_array_length = 51

    (0...nums.length).each do |i|
        gcd = nums[i]
        ((i + 1)...nums.length).each do |j|
            gcd = gcd.gcd(nums[j])
            if gcd == 1
                shortest_array_length = [(j - i + 1), shortest_array_length].min
                break
            end
        end
    end

    return -1 if shortest_array_length.equal?(51)

    shortest_array_length + nums.length - 2
end