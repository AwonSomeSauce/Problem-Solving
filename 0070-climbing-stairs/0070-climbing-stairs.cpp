class Solution {
public:
    int climbStairs(int n) {
        int k = 2;
        vector<int> arr(n + 1, 0);
        arr[0] = 1;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= k; j++) {
                int m = i - j;
                if (m < 0) continue;
                arr[i] += arr[m];
            }
        }
        return arr[n];
    }
};