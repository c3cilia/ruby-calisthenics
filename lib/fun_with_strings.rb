module FunWithStrings
  def palindrome? 
    self.downcase.gsub(/[^0-9A-Za-z]/, '') == self.reverse.downcase.gsub(/[^0-9A-Za-z]/, '')
  end
  def count_words
    split_string = self.split
    #Used the group_by method from Enumarable mixin
    result = Hash[split_string.group_by {|x| x.downcase.gsub(/[^0-9A-Za-z]/, '')}.map {|k,v| [k,v.count]}]
    result.delete_if {|key, value| key == "" }
    result 

  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
