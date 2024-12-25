# @param {Integer[][]} points
# @return {Integer}
def number_of_boomerangs(points)
    distance_count = {}
    boomerangs = 0
    points.each_with_index do |point_1, index_1|
        points[(index_1 + 1)..].each_with_index do |point_2, index_2|
        distance = (point_1[0] - point_2[0])**2 + (point_1[1] - point_2[1])**2
        distance_count[index_1] ||= {}
        distance_count[index_1][distance] ||= 0
        distance_count[index_1][distance] += 1

        distance_count[index_2 + index_1 + 1] ||= {}
        distance_count[index_2 + index_1 + 1][distance] ||= 0
        distance_count[index_2 + index_1 + 1][distance] += 1
        end
    end

    distance_count.each_value do |distances|
        distances.each_value do |count|
        next if count < 2

        boomerangs += count * (count - 1)
        end
    end

    boomerangs
end