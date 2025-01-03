# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
    frequencies = arr.tally
    frequencies = frequencies.sort_by { |_, value| value }.to_h
    elements_removed = 0
    removed_frequency = 0
    frequencies.each do |key, value|
        removed_frequency += value
        break if removed_frequency > k

        elements_removed += 1
    end

    frequencies.size - elements_removed
end