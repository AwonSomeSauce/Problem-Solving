class Solution {
public:
    int jump(vector<int>& nums) {
        int N = nums.size();
        vector<int> dp(N, INT_MAX);
        dp[0] = 0;
        for (int i = 0; i < N; i++) {
            int k = nums[i];
            for (int j = i + 1; j < min((i + k + 1), N); j++) {
                dp[j] = min(dp[j], dp[i] + 1);
            }
        }
        return dp[N - 1];
    }
};