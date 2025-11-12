# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
    dp = Array.new(strs.length + 1) { Array.new(m + 1, 0) { Array.new(n + 1, 0) } }

    (1..strs.length).each do |idx|
        zeros_now = strs[idx - 1].count("0")
        ones_now = strs[idx - 1].count("1")
        (0..m).each do |zeros|
            (0..n).each do |ones|
                if zeros_now <= zeros && ones_now <= ones
                    dp[idx][zeros][ones] = [dp[idx - 1][zeros][ones], dp[idx - 1][zeros - zeros_now][ones - ones_now] + 1].max
                else
                    dp[idx][zeros][ones] = dp[idx - 1][zeros][ones]
                end
            end
        end
    end

    dp[strs.length][m][n]
end
