require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get :index  #testing there is an index path
    assert_response :success
  end

  test "should get new " do
    get :new #testing there is an new path
    assert_response :success
  end

  test "should get show" do
    get :show, {'id' => @category.id}  #testing for show path, id is here because id is needed to show certain category
    assert_response :success
  end
end
