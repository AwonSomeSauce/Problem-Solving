# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
    element_counts = Hash.new(0)
    min_count = nums.length / 3
    nums.each do |num|
        element_counts[num] += 1
    end

    element_counts.keys.reduce([]) do |acc, element|
        acc.push(element) if element_counts[element] > min_count
        acc
    end
end