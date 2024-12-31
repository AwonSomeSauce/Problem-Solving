# @param {Integer[]} time
# @return {Integer}
def num_pairs_divisible_by60(time)
    mod_of_time = Hash.new(0)
    number_of_pairs = 0

    time.each do |t|
        mod = t % 60
        modular_inverse = (-mod + 60) % 60
        number_of_pairs += mod_of_time[modular_inverse]
        mod_of_time[mod] += 1
    end

    number_of_pairs
end