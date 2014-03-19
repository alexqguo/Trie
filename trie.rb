class Trie
  
  attr_reader :root
  
  def initialize
    @root = TrieNode.new("", nil)
  end
  
  def add_word(word, node = @root)
    if word == ""
      node.end_of_word = true 
    else
      child = node.add_or_find_child(word[0])
      add_word(word[1..-1], child)
    end
  end
  
end



class TrieNode
  
  attr_reader :value, :parent, :children
  attr_accessor :end_of_word
  
  def initialize(value, parent, end_of_word = false, children = [])
    raise "Invalid TrieNode Value - #{value}" unless value.is_a?(String) && value.length <= 1
    @value, @parent, @end_of_word, @children = value, parent, end_of_word, children
  end
  
  def has_child?(char)
    @children.include?(char)
  end
  
  def add_child(char)
    unless has_child?(char)
      new_child = TrieNode.new(char, self)
      @children << new_child
    
      new_child
    else
      nil
    end
  end
  
  def find_child(char)
    @children.find { |child| child.value == char }
  end
  
  def add_or_find_child(char)
    find_child(char) || add_child(char)
  end
  
  def children_values
    @children.map(&:value)
  end
end

=begin

node = TrieNode.new("a", nil)
node.add_child("d")
node.add_child("c")

trie = Trie.new
trie.add_word("help")
trie.add_word("hell")
trie.add_word("hello")

=end