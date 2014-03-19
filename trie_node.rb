class TrieNode
  
  attr_reader :value, :parent, :children
  attr_accessor :end_of_word
  
  def initialize(value, parent, level, end_of_word = false, children = [])
    raise "Invalid TrieNode Value - #{value}" unless value.is_a?(String) && value.length <= 1
    @value, @parent, @level, @end_of_word, @children = value, parent, level, end_of_word, children
  end
  
  def has_child?(char)
    @children.include?(char)
  end
  
  def add_child(char)
    unless has_child?(char)
      new_child = TrieNode.new(char, self, @level + 1)
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
  
  def get_words(prefix = "")
    words = []
    prefix += @value
    @children.each { |child| words << child.get_words(prefix) }
    
    words << prefix if @end_of_word
    words.flatten
  end

  def print
    puts "#{"." * (@level - 1)}#{@value}#{"*" if @end_of_word}"
    @children.each(&:print)
  end
  
end