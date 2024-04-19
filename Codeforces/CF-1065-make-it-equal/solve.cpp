#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int numOfTowers, maxAllowedCut;
    cin >> numOfTowers >> maxAllowedCut;

    vector<int> towerHeights(numOfTowers);
    for (int i = 0; i < numOfTowers; i++) {
        cin >> towerHeights[i];
    }

    // Sort the tower heights to easily find the difference in heights
    sort(towerHeights.begin(), towerHeights.end());

    // If the tallest and shortest towers are of equal height, no cuts are needed.
    if (towerHeights.back() == towerHeights.front()) {
        cout << 0 << endl;
        return 0;
    }

    long long int totalCuts = 0;                   // Total number of cuts performed
    long long int currentCutVolume = 0;            // Current volume of the cut
    long long int currentIndex = numOfTowers - 1;  // Start from the tallest tower
    long long int multipleOfBlocks = 1;            // Multiples of blocks to cut at each step

    while (true) {
        if (towerHeights[currentIndex] == towerHeights[0]) {
            totalCuts++;
            break;
        }

        long long int heightDifference = towerHeights[currentIndex] - towerHeights[currentIndex - 1];
        currentCutVolume += heightDifference * multipleOfBlocks;

        if (currentCutVolume <= maxAllowedCut) {
            multipleOfBlocks++;
            currentIndex--;
            continue;
        }

        // Calculate the height that still needs to be cut to stay within the maxAllowedCut
        long long int excessCut = currentCutVolume - maxAllowedCut;
        long long int heightToCut = excessCut / multipleOfBlocks + (excessCut % multipleOfBlocks != 0);

        towerHeights[currentIndex] -= (heightDifference - heightToCut);
        totalCuts++;
        currentCutVolume = 0;  // Reset the current cut volume for the next iteration
    }

    cout << totalCuts << endl;
    return 0;
}
