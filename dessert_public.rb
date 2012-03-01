class Dessert
  HEALTY_MAX_CALORIES = 199
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name, @calories = name, calories
  end

  def healthy?
    @calories <= HEALTY_MAX_CALORIES
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super( name, calories )
    @flavor = flavor
  end

  def delicious?
    @flavor == "black licorice"
  end
end

