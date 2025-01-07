# @param {Integer[]} nums
# @return {Integer}
def maximum_sum(nums)
    sum_frequencies = {}
    maximum_sum = 0

    nums.each do |num|
        sum = num.to_s.chars.map(&:to_i).sum
        sum_frequencies[sum] ||= []
        sum_frequencies[sum] << num
    end

    sum_frequencies.select! { |_, val| val.length > 1 }

    return -1 if sum_frequencies.empty?

    sum_frequencies.each_value do |arr|
        arr.sort! { |a, b| b <=> a }
        maximum_sum = [maximum_sum, (arr[0] + arr[1])].max
    end

    maximum_sum
end