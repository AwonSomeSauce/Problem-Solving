# @param {Integer[]} nums
# @return {Integer}
def ways_to_split_array(nums)
    prefix_sum = []
    sum = 0
    valid_splits = 0

    nums.each do |num|
        sum = sum + num
        prefix_sum << sum
    end

    (nums.length - 1).times do |index|
        left = prefix_sum[index]
        right = prefix_sum[nums.length - 1] - left
        valid_splits += 1 if left >= right
    end

    valid_splits
end