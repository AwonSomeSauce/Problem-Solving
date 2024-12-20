# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
    nums.uniq!
    nums.sort!
    longest_length = 0
    current_length = 0
    nums.each_with_index do |num, index|
        if index.zero?
            current_length += 1
            next
        end

        if num == nums[index - 1] + 1
        current_length += 1
        else
        longest_length = [longest_length, current_length].max
        current_length = 1
        end
    end

    longest_length = [longest_length, current_length].max
end