class Solution {
private:
    const int INF = INT_MAX;
public:
    void dijkstra(int source, const vector<vector<pair<int, int>>>& graph, vector<int>& distances) {
        int n = graph.size();
        distances[source] = 0;
        
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
        pq.push({0, source});

        while (!pq.empty()) {
            int dist = pq.top().first;
            int node = pq.top().second;
            pq.pop();

            if (dist > distances[node]) continue;

            for (const auto& neighbor : graph[node]) {
                int nextNode = neighbor.first;
                int weight = neighbor.second;
                int newDist = dist + weight;

                if (newDist < distances[nextNode]) {
                    distances[nextNode] = newDist;
                    pq.push({newDist, nextNode});
                }
            }
        }
    }

    int networkDelayTime(vector<vector<int>>& times, int n, int k) {
        vector<vector<pair<int, int>>> graph(n);
        vector<int> distances(n, INF);

        for (int i = 0; i < times.size(); i++) {
            graph[times[i][0] - 1].push_back({times[i][1] - 1, times[i][2]});
        }

        dijkstra(k - 1, graph, distances);

        sort(distances.begin(), distances.end());

        if (distances[n - 1] == INF) return -1;
        return distances[n - 1];
    }
};