# @param {String} boxes
# @return {Integer[]}
def min_operations(boxes)
    indices = []
    answer = []

    boxes.chars.each_with_index do |char, index|
        next if char == '0'
        indices << index
    end

    boxes.chars.each_with_index do |char, index_1|
        minimum_moves = 0
        indices.each do |index_2|
            diff = (index_1 - index_2).abs
            minimum_moves += diff
        end
        answer << minimum_moves
    end

    answer
end