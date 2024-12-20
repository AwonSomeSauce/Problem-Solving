# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_can_be_segmented?(s, word_dict, dp)
  return true if s.empty?
  return dp[s] if dp.key?(s)

  s.length.times do |i|
    substring = s.slice(0..i)
    if word_dict.any?(substring)
      dp[substring] = true
      remaining_string = s.slice(i + 1..-1)

      return true if word_can_be_segmented?(remaining_string, word_dict, dp)
    else
      dp[substring] = false
    end
  end

  false
end

def word_break(s, word_dict)
  dp = {}
  word_can_be_segmented?(s, word_dict, dp)
end