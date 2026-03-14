/**
 * @param {number} n
 * @param {number} k
 * @return {string}
 */

let count = 0;
let happyChars = ['a', 'b', 'c'];

var getHappyString = function(n, k) {
    let result = nthHappyString(n, k, '', 0);
    count = 0;

    return result === null ? '' : result;    
};

function nthHappyString(n, k, currentString, currentLength) {
    if (currentLength === n) {
        count += 1;
        if (count === k) return currentString;

        return null;
    }

    for (const char of happyChars) {
        if (char === currentString.at(-1)) continue;

        nextString = currentString + char;
        nextLength = currentLength + 1;

        nthString = nthHappyString(n, k, nextString, nextLength);

        if (nthString !== null) return nthString;
    }

    return null;
}
