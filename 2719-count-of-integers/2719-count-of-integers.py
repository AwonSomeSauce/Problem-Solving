class Solution:
    def count(self, num1: str, num2: str, min_sum: int, max_sum: int) -> int:
        # Ensure num1 has leading zeros to match the length of num2
        len_diff = len(num2) - len(num1)
        if len_diff > 0:
            num1 = '0' * len_diff + num1

        arr1 = [int(digit) for digit in num1]
        arr2 = [int(digit) for digit in num2]
        modulo = 10 ** 9 + 7

        @lru_cache(None)
        def count_good_xs(pos, is_bottom_tight, is_top_tight, sum_so_far):
            if pos == len(arr1):
                return int(min_sum <= sum_so_far <= max_sum)

            lower_limit = 0 if not is_bottom_tight else arr1[pos]
            upper_limit = 9 if not is_top_tight else arr2[pos]
            ways = 0

            for d in range(lower_limit, upper_limit + 1):
                ways += count_good_xs(
                    pos + 1,
                    is_bottom_tight and d == arr1[pos],
                    is_top_tight and d == arr2[pos],
                    (sum_so_far + d)
                ) % modulo

            return ways % modulo

        return count_good_xs(0, True, True, 0)
        