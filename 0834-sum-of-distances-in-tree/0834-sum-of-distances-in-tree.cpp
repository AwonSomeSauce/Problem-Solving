class Solution {
public:
    static const int N = 3 * 1e4 + 1;
    vector<int> graph[N];
    int subtreeSize[N];
    
    void dfsPreorder(int current, int parent, vector<int>& distances) {
        subtreeSize[current] = 1;
        for (int neighbour : graph[current]) {
            if (neighbour != parent) {
            dfsPreorder(neighbour, current, distances);
            subtreeSize[current] += subtreeSize[neighbour];
            distances[0] += subtreeSize[neighbour];
            }
        }
    }

    void dfsPostorder(int current, int parent, int n, vector<int>& distances) {
        for (int neighbour : graph[current]) {
            if (neighbour != parent) {
                distances[neighbour] = distances[current] - subtreeSize[neighbour] + (n - subtreeSize[neighbour]);
                dfsPostorder(neighbour, current, n, distances);
            }
        }
    }

    vector<int> sumOfDistancesInTree(int n, vector<vector<int>>& edges) {
        vector<int> distances(n, 0);

        for (int i = 0; i < n - 1; i++) {
            graph[edges[i][0]].push_back(edges[i][1]);
            graph[edges[i][1]].push_back(edges[i][0]);
        }

        dfsPreorder(0, 0, distances);
        dfsPostorder(0, 0, n, distances);

        return distances;
    }
};