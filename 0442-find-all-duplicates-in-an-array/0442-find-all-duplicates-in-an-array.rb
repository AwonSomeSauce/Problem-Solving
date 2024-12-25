# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
    twice_numbers = []
    number_count = Hash.new(0)
    nums.each do |num|
        number_count[num] += 1
        twice_numbers.push(num) if number_count[num] == 2
    end

    twice_numbers
end