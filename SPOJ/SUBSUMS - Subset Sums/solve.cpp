#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

// Function to compute all subset sums of a segment of the array
vector<long long> getSubsetSums(const vector<long long>& values, int start, int end) {
    vector<long long> subsetSums;
    long long numCombinations = 1LL << (end - start);
    for (long long bitmask = 0; bitmask < numCombinations; bitmask++) {
        long long subsetSum = 0;
        for (long long j = 0; j < (end - start); j++) {
            if (bitmask & (1LL << j)) {
                subsetSum += values[start + j];
            }
        }
        subsetSums.push_back(subsetSum);
    }
    return subsetSums;
}

int main() {
    int N;
    long long A, B;
    cin >> N >> A >> B;
    vector<long long> values(N);
    for (int i = 0; i < N; i++) {
        cin >> values[i];
    }

    // Split the array into two halves
    int mid = N / 2;
    vector<long long> leftSubsets = getSubsetSums(values, 0, mid);
    vector<long long> rightSubsets = getSubsetSums(values, mid, N);

    // Sort the subset sums to facilitate binary searching
    sort(leftSubsets.begin(), leftSubsets.end());
    sort(rightSubsets.begin(), rightSubsets.end());

    long long count = 0;
    for (long long sumFromLeft : leftSubsets) {
        long long minSum = A - sumFromLeft;
        long long maxSum = B - sumFromLeft;

        // Count ranges that fit within [minSum, maxSum)
        long long lowerIdx = lower_bound(rightSubsets.begin(), rightSubsets.end(), minSum) - rightSubsets.begin();
        long long upperIdx = upper_bound(rightSubsets.begin(), rightSubsets.end(), maxSum) - rightSubsets.begin();

        count += upperIdx - lowerIdx;
    }

    cout << count << endl;
    return 0;
}
