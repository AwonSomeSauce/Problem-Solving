class Solution {
public:
    vector<int> findAnagrams(string s, string p) {
        int N = s.length(), M = p.length();
        vector<int> anagrams;
        vector<int> counts(26, 0);
        vector<int> pCounts(26, 0);

        for (int i = 0; i < M; i++) {
            counts[s[i] - 'a']++;
            pCounts[p[i] - 'a']++;
        }

        if (counts == pCounts) anagrams.push_back(0);

        for (int i = 1; i <= (N - M); i++) {
            counts[s[i - 1] - 'a']--;
            counts[s[i + M - 1] - 'a']++;
            if (counts == pCounts) anagrams.push_back(i);
        }

        return anagrams;
    }
};