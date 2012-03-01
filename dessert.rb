require 'minitest/spec'
require 'minitest/autorun'


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
    @flavor == "black licorice" ? false : super.delicius? 
  end
end

describe Dessert do
  
  it 'should have getter for name' do
    Dessert.new( "Arizona", 200 ).name.must_equal 'Arizona'
  end

  it 'should have setter for name' do
    dessert = Dessert.new( "Arizona", 200 )
    dessert.name = "Other"
    dessert.name.must_equal( "Other" )
  end

  it 'should have getter for calories' do
    Dessert.new( "Arizona", 200 ).calories.must_equal 200
  end

  it 'should have setter for calories' do
    dessert = Dessert.new( "Arizona", 200 )
    dessert.calories = 300
    dessert.calories.must_equal( 300 )
  end

  it 'should return healty as true if @calories < 200 'do
    Dessert.new( "Arizona", 190 ).healthy?.must_equal( true )
  end

  it 'should return healty as true if @calories > 200 'do
    Dessert.new( "Arizona", 200 ).healthy?.must_equal( false )
  end

  it 'should return true for all Dessert instance on delicious?' do
    Dessert.new( "Arizona", 200 ).delicious?.must_equal( true )
  end

  it 'should have getter for name' do
    JellyBean.new( "Arizona", 200, 'flavor' ).flavor.must_equal 'flavor'
  end

  it 'should have setter for name' do
    dessert = JellyBean.new( "Arizona", 200, 'flavor' )
    dessert.flavor = "Other"
    dessert.flavor.must_equal( "Other" )
  end

  it 'should return false for JellyBeans if the flavor is  black licorice' do
    dessert = JellyBean.new( "Arizona", 200, 'black licorice' )
    dessert.delicious?().must_equal false   
  end

end

