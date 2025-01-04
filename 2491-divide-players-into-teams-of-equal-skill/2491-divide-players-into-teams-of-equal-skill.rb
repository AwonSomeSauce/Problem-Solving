# @param {Integer[]} skill
# @return {Integer}
def divide_players(skill)
    return skill.reduce(1) { |arr, val| arr * val } if skill.length == 2

    total_sum = skill.sum
    n = skill.length

    return -1 unless (total_sum % (n / 2)).zero?

    team_skill = total_sum / (n / 2)
    chemistry_sum = 0
    skill_counts = skill.tally

    skill_counts.each do |key, value|
        next if value.zero?

        other_key = team_skill - key
        if key.eql?(other_key)
            return -1 if value.odd?

            chemistry_sum += (value / 2) * (key * other_key)
        else
            return -1 if !skill_counts.key?(other_key) || value != skill_counts[other_key]

            chemistry_sum += value * (key * other_key) unless key.eql?(other_key)
        end
        skill_counts[key] = 0
        skill_counts[other_key] = 0
    end

    chemistry_sum
end