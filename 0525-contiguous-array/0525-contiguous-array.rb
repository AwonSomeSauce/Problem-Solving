# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
    prefix_sum = []
    sum_indices = {}
    max_length = 0

    nums.each_with_index do |num, index|
        adjustment = num.zero? ? -1 : 1
        sum = index.zero? ? adjustment : prefix_sum.last + adjustment

        prefix_sum << sum
        sum_indices[sum] ||= []
        sum_indices[sum] << index
    end
    
    sum_indices.each do |sum, arr|
        length = arr.last - (sum.zero? ? -1 : arr.first)
        max_length = [max_length, length].max
    end

    max_length
end