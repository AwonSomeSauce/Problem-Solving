class Trie
  def initialize
    @root = {}
    @end_of_word = '#'
  end


=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
    node = @root
    word.each_char do |char|
      node[char] ||= {}
      node = node[char]
    end
    node[@end_of_word] = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    find_sub_string(word) == word
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    !find_sub_string(prefix).nil?
  end

  private

  def find_sub_string(word)
    node = @root
    word.each_char do |char|
      return nil unless node.key?(char)

      node = node[char]
    end

    return word if node[@end_of_word]

    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)