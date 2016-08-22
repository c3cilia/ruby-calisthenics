# This is testing instance variable inheritance 
class Dessert
  attr_accessor :calories
  attr_accessor :name
  def initialize(name, calories)
    @calories = calories
    @name = name
  end
  def healthy?
    if @name == "cake" 
      return false
    end 
    true
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor, name="vanilla jelly bean ", calories=5)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    print name
    if @flavor == "licorice"
      return false
    end
    true
  end
end
