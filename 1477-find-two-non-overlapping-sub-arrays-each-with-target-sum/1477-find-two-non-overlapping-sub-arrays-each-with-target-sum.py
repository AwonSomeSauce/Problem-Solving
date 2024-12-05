class Solution:
    def minSumOfLengths(self, arr: List[int], target: int) -> int:
        n = len(arr)
        left_min_len = [float('inf')] * n
        right_min_len = [float('inf')] * n

        # Calculate minimum subarray lengths for the left prefix
        prefix_sum = 0
        prefix_map = {0: -1}
        for i in range(n):
            prefix_sum += arr[i]
            if prefix_sum - target in prefix_map:
                subarray_len = i - prefix_map[prefix_sum - target]
                left_min_len[i] = min(left_min_len[i - 1], subarray_len) if i > 0 else subarray_len
            else:
                left_min_len[i] = left_min_len[i - 1] if i > 0 else float('inf')
            prefix_map[prefix_sum] = i

        # Calculate minimum subarray lengths for the right prefix
        prefix_sum = 0
        prefix_map = {0: n}
        for i in range(n - 1, -1, -1):
            prefix_sum += arr[i]
            if prefix_sum - target in prefix_map:
                subarray_len = prefix_map[prefix_sum - target] - i
                right_min_len[i] = min(right_min_len[i + 1], subarray_len) if i < n - 1 else subarray_len
            else:
                right_min_len[i] = right_min_len[i + 1] if i < n - 1 else float('inf')
            prefix_map[prefix_sum] = i

        # Find the minimum sum of two non-overlapping subarray lengths
        result = float('inf')
        for i in range(n - 1):
            result = min(result, left_min_len[i] + right_min_len[i + 1])

        return result if result != float('inf') else -1
