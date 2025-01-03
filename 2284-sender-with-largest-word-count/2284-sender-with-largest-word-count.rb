# @param {String[]} messages
# @param {String[]} senders
# @return {String}
def largest_word_count(messages, senders)
    word_counts = {}

    messages.each_with_index do |message, index|
        word_counts[senders[index]] ||= 0
        word_counts[senders[index]] += message.split.length
    end

    word_counts = word_counts.sort do |(key_1, value_1), (key_2, value_2)|
        if value_1.eql?(value_2)
            key_2 <=> key_1
        else
            value_2 <=> value_1
        end
    end.to_h

    word_counts.first[0]
end