# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} num_operations
# @return {Integer}
def max_frequency(nums, k, num_operations)
    nums_sorted = nums.sort
    min_num = nums_sorted[0] - k
    max_num = nums_sorted[-1] + k
    
    max_count = 0
    nums_length = nums.length
    num_count = Hash.new(0)

    nums.each { |num| num_count[num] += 1 }

    (min_num..max_num).each do |num|
        l = find_lower_bound(num - k, nums_sorted, nums_length)
        r = find_upper_bound(num + k, nums_sorted, nums_length)
        same_number_count = [(r - l + 1), (num_operations + num_count[num])].min
        max_count = [max_count, same_number_count].max
    end

    max_count
end

def find_lower_bound(num, nums_sorted, nums_length)
  l = 0
  r = nums_length - 1
  ans = nums_length

  while l <= r
    mid = (l + r) / 2
    if nums_sorted[mid] >= num
      ans = mid
      r = mid - 1
    else
      l = mid + 1
    end
  end

  ans
end

def find_upper_bound(num, nums_sorted, nums_length)
  l = 0
  r = nums_length - 1
  ans = -1

  while l <= r
    mid = (l + r) / 2
    if nums_sorted[mid] <= num
      ans = mid
      l = mid + 1
    else
      r = mid - 1
    end
  end

  ans
end
