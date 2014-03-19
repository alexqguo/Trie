require_relative 'trie_node'

class Trie
  
  attr_reader :root
  
  def initialize
    @root = TrieNode.new("", nil, 0)
  end
  
  def add_word(word, node = @root)
    if word == ""
      node.end_of_word = true 
    else
      child = node.add_or_find_child(word[0])
      add_word(word[1..-1], child)
    end
  end
  
  def remove_word(word)
    # Use find_word to get the last node (return nil if it doesn't exist)
    # Go up through its parents recursively and clear the children until
    # => we find a parent with more than one child, and then only remove the
    # => proper one (this is to maintain minimum size)
    last_child = find_word(word)
    last_child ? last_child.remove_unnecessary_parents : false
  end
  
  def has_word?(word)
    !!find_word(word)
  end
  
  # This returns the last child of a word if it exists, nil otherwise
  # Break this up so it can be used by has_word? and remove_word
  def find_word(word, node = @root)
    if word == "" && node.end_of_word
      return node
    else
      child = node.find_child(word[0])
      child ? find_word(word[1..-1], child) : nil
    end
  end
  
  def all_words
    @root.get_words
  end
  
  def render
    @root.children.each(&:print)
    nil
  end
  
end



=begin

load 'trie.rb'
node = TrieNode.new("a", nil)
node.add_child("d")
node.add_child("c")

load 'trie.rb'
trie = Trie.new
trie.add_word("help")
trie.add_word("hell")
trie.add_word("hello")
trie.add_word("app")
trie.add_word("apps")
trie.add_word("apple")
trie.add_word("apply")
trie.add_word("application")
trie.add_word("applicable")

=end