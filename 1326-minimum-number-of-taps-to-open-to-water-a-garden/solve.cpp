class Solution {
   private:
    static bool compareByStartThenLength(const pair<int, int>& a, const pair<int, int>& b) {
        if (a.first == b.first) {
            return (a.second - a.first) > (b.second - b.first);
        }
        return a.first < b.first;
    }

   public:
    int minTaps(int n, vector<int>& ranges) {
        vector<pair<int, int>> expandedRanges;
        for (int i = 0; i <= n; ++i) {
            int left = max(0, i - ranges[i]);
            int right = min(i + ranges[i], n);
            expandedRanges.emplace_back(left, right);
        }

        // Sort ranges to facilitate greedy selection
        sort(expandedRanges.begin(), expandedRanges.end(), compareByStartThenLength);

        int taps = 0, coveredUntil = 0, i = 0;
        while (coveredUntil < n) {
            int furthestReach = coveredUntil;
            // Find the furthest reach within the current coverage
            while (i < expandedRanges.size() && expandedRanges[i].first <= coveredUntil) {
                furthestReach = max(furthestReach, expandedRanges[i].second);
                ++i;
            }

            if (furthestReach == coveredUntil) {
                // No progress made, return failure indicator
                return -1;
            }

            // Update coverage and increment tap count
            coveredUntil = furthestReach;
            ++taps;
        }

        return taps;
    }
};
