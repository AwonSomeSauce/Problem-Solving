class Solution {
private:
    static bool customSort(vector<int> a, vector<int> b) {
        if (a[2] < b[2]) return true;
        if (a[2] == b[2]) {
            if (a[1] < b[1]) return true;
            if (a[1] == b[1]) {
                if (a[0] < b[0]) return true;
            }
        }

        return false;
    }
public:
    int maxHeight(vector<vector<int>>& cuboids) {
        int maximumHeightSoFar = INT_MIN, N = cuboids.size();
        vector<int> dp(N);
        for (int i = 0; i < N; i++) sort(cuboids[i].begin(), cuboids[i].end());
        sort(cuboids.begin(), cuboids.end(), customSort);
        for (int i = 0; i < N; i++) {
            dp[i] = cuboids[i][2];
            for (int j = 0; j < i; j++) {
                vector<int> cuboid = cuboids[j];
                if (cuboids[j][0] <= cuboids[i][0] && cuboids[j][1] <= cuboids[i][1] && cuboids[j][2] <= cuboids[i][2]) {
                    dp[i] = max(dp[i], dp[j] + cuboids[i][2]);
                }
            }
            maximumHeightSoFar = max(maximumHeightSoFar, dp[i]);
        }

        return maximumHeightSoFar;
    }
};