# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
    trusting_count = {}
    trustee_count = {}

    trust.each do |arr|
        trusting_count[arr[0]] ||= 0
        trustee_count[arr[1]] ||= 0

        trusting_count[arr[0]] += 1
        trustee_count[arr[1]] += 1
    end

    trustee_count.each_key do |key|
        return key if trustee_count[key] == n - 1 && !trusting_count.key?(key)
    end

    -1
end