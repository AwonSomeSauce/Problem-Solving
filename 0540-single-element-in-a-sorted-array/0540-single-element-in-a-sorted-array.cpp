class Solution {
public:
    int singleNonDuplicate(vector<int>& nums) {
        int answer = 0;

        for (int num : nums) {
            answer ^= num;
        }

        return answer;
    }
};