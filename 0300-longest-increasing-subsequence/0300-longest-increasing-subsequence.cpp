class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        int maxLength = 1, N = nums.size();
        vector<int> dp(N, 1);
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < i; j++) {
            if (nums[j] < nums[i]) {
                dp[i] = max(dp[i], dp[j] + 1);
                maxLength = max(maxLength, dp[i]);
            }
            }
        }
        
        return maxLength;
    }
};