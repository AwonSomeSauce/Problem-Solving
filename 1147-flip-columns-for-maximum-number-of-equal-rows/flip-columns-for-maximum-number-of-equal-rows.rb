# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(matrix)
    m = matrix.length
    max_rows = 0

    matrix.each_with_index do |arr, index|
        eligible_rows = 0
        inverse_arr = matrix[index].map { |k| 1 - k }

        (index..m).each do |j|
            eligible_rows += 1 if matrix[index] == matrix[j]
            eligible_rows += 1 if inverse_arr == matrix[j]
        end

        max_rows = [max_rows, eligible_rows].max
    end

    max_rows
end
