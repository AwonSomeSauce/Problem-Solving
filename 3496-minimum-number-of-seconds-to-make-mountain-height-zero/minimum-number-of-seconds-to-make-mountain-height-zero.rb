# @param {Integer} mountain_height
# @param {Integer[]} worker_times
# @return {Integer}
def min_number_of_seconds(mountain_height, worker_times)
    min_worker_time = 1
    max_worker_time = (mountain_height * (mountain_height + 1) * worker_times.max) / 2

    return binary_search_minimum_total_time(min_worker_time, max_worker_time, mountain_height, worker_times)
end

def binary_search_minimum_total_time(min_worker_time, max_worker_time, mountain_height, worker_times)
    min_total_time = 0

    while min_worker_time <= max_worker_time
        current_time = min_worker_time + (max_worker_time - min_worker_time) / 2
        height_covered_in_current_time = 0

        worker_times.each do |worker_time|
            height_covered_by_worker = ((-1.0 + Math.sqrt(1.0 + (8.0 * current_time) / worker_time)) / 2.0).floor
            height_covered_in_current_time += height_covered_by_worker
        end

        if height_covered_in_current_time < mountain_height
            min_worker_time = current_time + 1
        else
            min_total_time = current_time
            max_worker_time = current_time - 1
        end
    end

    return min_total_time
end
