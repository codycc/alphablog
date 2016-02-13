require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
      get new_category_path #checking that the path works
      assert_template 'categories/new' #checking that the template renders
      assert_difference 'Category.count',1 do  #checkign if the count of categories went up, if category is made then it would
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index' #checking that the category shows up afterwards on the index
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
     assert_no_difference 'Category.count' do  #there would be no difference in count since new category wasnt created
    post categories_path, category: {name: " "} # if the category is invalid
  end
  assert_template 'categories/new'
  assert_select "h2.panel-title"# this is what the errors are in so were checking if the error message popped up
  assert_select 'div.panel-body'


  end


end
