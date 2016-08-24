module FunWithStrings
  def palindrome? 
    self.downcase.gsub(/[^0-9A-Za-z]/, '') == self.reverse.downcase.gsub(/[^0-9A-Za-z]/, '')
  end
  def count_words
    split_string = self.split
    #Used the group_by method from Enumarable mixin
    result = Hash[split_string.group_by {|x| x.downcase.gsub(/[^0-9A-Za-z]/, '')}.map {|k,v| [k,v.count]}]
    result.delete_if {|key, value| key == ""}
    result 
  end
  def anagram_groups
    split_string = self.split
    sorted_strings = split_string.map {|item| item.chars.sort {|a, b| a.casecmp(b)} .join}
    dup_indices = Hash.new {|h,k| h[k]=[]}
    sorted_strings.each_index do |i| 
      dup_indices[sorted_strings[i]] << i unless 0 == sorted_strings.count(sorted_strings[i])
    end
    dup_indices_array =  dup_indices.values
    dup_indices_array.size.times do |i|
      dup_indices_array[i].size.times do |j|
        dup_indices_array[i][j] = split_string[dup_indices_array[i][j]]
      end 
    end
    dup_indices_array
  end
end

# make all the above functions available as instance methods on Strings:
class String
  include FunWithStrings
end
