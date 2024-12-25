# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
    secret_digit_counts = Hash.new(0)
    guess_digit_counts = Hash.new(0)

    secret.chars.each do |digit|
        secret_digit_counts[digit] += 1
    end

    guess.chars.each do |digit|
        guess_digit_counts[digit] += 1
    end

    bulls = 0
    matches = 0

    secret.length.times do |index|
        bulls += 1 if secret[index] == guess[index]
    end

    secret_digit_counts.each_key do |key|
        matches += [secret_digit_counts[key], guess_digit_counts[key]].min
    end

    cows = matches - bulls

    "#{bulls}A#{cows}B"
end