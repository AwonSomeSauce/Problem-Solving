# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    monotonic_stack = []
    operations = 0

    nums.each do |num|
        top_number = monotonic_stack.last

        if !top_number.nil? && top_number > num
            while !monotonic_stack.empty? && monotonic_stack.last > num
                operations += 1
                monotonic_stack.pop
            end
        end

        monotonic_stack.push(num) if monotonic_stack.last != num && !num.zero?
    end

    operations + monotonic_stack.size
end