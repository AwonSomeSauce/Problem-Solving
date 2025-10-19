class MagicDictionary
    def initialize()
        @words = Set.new
        @alphabets = 'abcdefghijklmnopqrstuvwxyz'
    end


=begin
    :type dictionary: String[]
    :rtype: Void
=end
    def build_dict(dictionary)
        @words = dictionary.to_set
    end


=begin
    :type search_word: String
    :rtype: Boolean
=end
    def search(search_word)
        (0...search_word.length).each do |i|
            @alphabets.chars.each do |c|
                unless c == search_word[i]
                    new_string = search_word.dup
                    new_string[i] = c
                    return true if @words.include? new_string
                end
            end
        end

        false
    end


end

# Your MagicDictionary object will be instantiated and called as such:
# obj = MagicDictionary.new()
# obj.build_dict(dictionary)
# param_2 = obj.search(search_word)