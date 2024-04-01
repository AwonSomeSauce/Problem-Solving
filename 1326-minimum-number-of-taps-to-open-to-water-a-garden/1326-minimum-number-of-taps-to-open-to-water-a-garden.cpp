class Solution {
private:
    static bool customCompare(pair<int, int>& a, pair<int, int>& b) {
        if (a.first == b.first) {
            int lengthA = a.second - a.first;
            int lengthB = b.second - b.first;
            return (lengthA > lengthB);
        }

        return (a.first < b.first);
    }
public:
    int minTaps(int n, vector<int>& ranges) {
        vector<pair<int, int>> wholeRanges;
        for (int i = 0; i <= n; i++) {
            int leftRange = i - ranges[i];
            int rightRange = i + ranges[i];
            wholeRanges.push_back({max(0, leftRange), min(rightRange, n)});
        }
        sort(wholeRanges.begin(), wholeRanges.end(), customCompare);
        int count = 1, currentTap = 1, covered = wholeRanges[0].second;
        while (covered < n && currentTap <= n) {
            if (currentTap > covered) return -1;
            int rightMost = covered;
            while (currentTap <= n && wholeRanges[currentTap].first <= covered) {
                rightMost = max(wholeRanges[currentTap].second, rightMost);
                currentTap++;
            }
            covered = rightMost;
            count = count + 1;
        }

        if (covered >= n) return count;
        return -1;
    }
};