require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid? #checking that the category is valid
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid? # empty string so the test will pass if the category isnt valid since validations were put in
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")  #there is already a sports category so test will pass if the category isnt valid hence assert_not
    assert_not category2.valid?
  end

  test "name should not be too long " do
    @category.name = "a" * 26  # the validation states max is 25 characters so the test will pass if the category isnt valid
    assert_not @category.valid?
  end

  test " name should not be too short " do
    @category.name = "aa" #the validation states min is 3 characters so the test will pass if the category isnt valid
    assert_not @category.valid?
  end



end
