class Solution:
    def numberOfPowerfulInt(self, start: int, finish: int, limit: int, s: str) -> int:
        start_str = str(start)
        finish_str = str(finish)
        len_diff = len(finish_str) - len(start_str)
        if len_diff > 0:
            start_str = '0' * len_diff + start_str

        lower_bound = [int(digit) for digit in start_str]
        upper_bound = [int(digit) for digit in finish_str]

        @lru_cache(None)
        def countMatchingNumbers(pos: int, is_lower_tight: bool, is_upper_tight: bool) -> int:
            if pos == len(lower_bound):
                return 1

            lower_limit = lower_bound[pos] if is_lower_tight else 0
            upper_limit = min(upper_bound[pos],
                              limit) if is_upper_tight else limit
            count = 0

            for digit in range(lower_limit, upper_limit + 1):
                if pos >= (len(lower_bound) - len(s)):
                    diff = len(lower_bound) - pos
                    sPos = len(s) - diff
                    if str(digit) == s[sPos]:
                        count += countMatchingNumbers(
                            pos + 1,
                            is_lower_tight and digit == lower_bound[pos],
                            is_upper_tight and digit == upper_bound[pos]
                        )
                else:
                    count += countMatchingNumbers(
                        pos + 1,
                        is_lower_tight and digit == lower_bound[pos],
                        is_upper_tight and digit == upper_bound[pos]
                    )

            return count

        return countMatchingNumbers(0, True, True)