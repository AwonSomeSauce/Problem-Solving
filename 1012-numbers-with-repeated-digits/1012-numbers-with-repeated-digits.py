class Solution:
    def numDupDigitsAtMostN(self, n: int) -> int:
        digits = list(map(int, str(n)))
        length = len(digits)

        @lru_cache(None)
        def countUniqueDigits(pos: int, is_tight: bool, mask: int, is_leading_zero: bool) -> int:
            # Base case
            if pos == length:
                return 1

            # Determine the upper limit for the current digit
            upper_limit = digits[pos] if is_tight else 9
            total_ways = 0

            for digit in range(upper_limit + 1):
                if is_leading_zero and digit == 0:
                    # Skip leading zeros without marking digits as used
                    total_ways += countUniqueDigits(
                        pos + 1,
                        is_tight and (digit == upper_limit),
                        mask,
                        True
                    )
                else:
                    # Skip if the digit is already used
                    if mask & (1 << digit):
                        continue
                    # Mark the digit as used
                    new_mask = mask | (1 << digit)
                    total_ways += countUniqueDigits(
                        pos + 1,
                        is_tight and (digit == upper_limit),
                        new_mask,
                        False
                    )

            return total_ways

        total_unique = countUniqueDigits(0, True, 0, True)
        return n - total_unique + 1