# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    index_one = -1
    index_two = -1
    nums.each_with_index do |value, index|
        difference = target - value
        second_index = nums[(index + 1)..].index(difference)
        if !second_index.nil?
        index_one = index
        index_two = second_index + index + 1
        return [index_one, index_two]
        end
    end

    nil
end