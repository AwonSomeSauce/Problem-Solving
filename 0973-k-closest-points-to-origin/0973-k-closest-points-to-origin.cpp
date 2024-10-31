class Solution {
private:
    static bool sortByTotalSum(const vector<int>& a, vector<int>& b) {
        int distanceX = (a[0] * a[0]) + (a[1] * a[1]);
        int distanceY = (b[0] * b[0]) + (b[1] * b[1]);
        return distanceX < distanceY;
    }
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        sort(points.begin(), points.end(), sortByTotalSum);

        if (k < points.size()) {
            points.erase(points.begin() + k, points.end());
        }
        
        return points;
    }
};