# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    num_count = Hash.new(0)
    kmf_numbers = []
    count = 0

    nums.each { |num| num_count[num] += 1 }

    num_count = num_count.sort_by { |key, value| -value }.to_h

    num_count.each_key do |key|
        break if count == k

        kmf_numbers << key
        count += 1
    end

    kmf_numbers
end