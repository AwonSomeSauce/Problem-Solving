# @param {Integer[]} cards
# @return {Integer}
def minimum_card_pickup(cards)
    first_index = {}
    minimum_distance = 10**6

    cards.each_with_index do |card, index|
        if first_index.key?(card)
            distance = index - first_index[card] + 1
            minimum_distance = [minimum_distance, distance].min
        end

        first_index[card] = index
    end

    minimum_distance.eql?(10**6) ? -1 : minimum_distance
end