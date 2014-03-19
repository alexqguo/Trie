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
trie.add_word("apple")
trie.add_word("apply")
trie.add_word("application")
trie.add_word("applicable")

=end