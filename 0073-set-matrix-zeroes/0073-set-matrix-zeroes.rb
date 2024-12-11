# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
    rows_and_columns = []
    matrix.each_with_index do |row, row_index|
        row.each_with_index do |val, col_index|
        rows_and_columns.append([row_index, col_index]) if val.zero?
        end
    end
    rows_and_columns.each do |indices|
        row_index = indices[0]
        col_index = indices[1]
        matrix[row_index].fill(0)
        matrix.map! do |row|
        row[col_index] = 0
        row
        end
    end
end