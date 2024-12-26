# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    if nums1.length < nums2.length
        nums1, nums2 = nums2, nums1
    end
    nums1_tracker = {}
    nums2_tracker = {}
    intersected_numbers = []
    nums1.each do |num|
        nums1_tracker[num] ||= 0
        nums1_tracker[num] += 1
    end
    nums2.each do |num|
        if nums1_tracker.key?(num)
            nums2_tracker[num] ||= 0
            if nums2_tracker[num] < nums1_tracker[num]
                nums2_tracker[num] += 1 
                intersected_numbers << num
            end
        end
    end

    intersected_numbers
end