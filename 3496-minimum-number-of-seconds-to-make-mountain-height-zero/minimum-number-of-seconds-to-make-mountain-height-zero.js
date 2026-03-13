/**
 * @param {number} mountainHeight
 * @param {number[]} workerTimes
 * @return {number}
 */
var minNumberOfSeconds = function(mountainHeight, workerTimes) {
    let minWorkerTime = 1;
    let maxWorkerTime = mountainHeight * (mountainHeight + 1) / 2 * Math.max(...workerTimes);

    return binarySearchMinimumTotalTime(minWorkerTime, maxWorkerTime, mountainHeight, workerTimes);
};

function binarySearchMinimumTotalTime(minWorkerTime, maxWorkerTime, mountainHeight, workerTimes) {
    let minTotalTime = 0;

    while (minWorkerTime <= maxWorkerTime) {
        let currentTime = Math.floor(minWorkerTime + (maxWorkerTime - minWorkerTime) / 2);
        let heightCoveredInCurrentTime = 0;

        for (const workerTime of workerTimes) {
            let heightCoveredByWorker = Math.floor((-1 + Math.sqrt(1 + (8 * currentTime) / workerTime)) / 2);
            heightCoveredInCurrentTime += heightCoveredByWorker;
        }

        if (heightCoveredInCurrentTime < mountainHeight) {
            minWorkerTime = currentTime + 1;
        } else {
            minTotalTime = currentTime;
            maxWorkerTime = currentTime - 1;
        }
    }

    return minTotalTime;
}
