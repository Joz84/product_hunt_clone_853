require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    result = assert_selector "h1", text: "Awesome Products"
    puts "- visiting the index correct".green if result == true

    result = assert_selector ".card-product", count: Product.count

  end



    # logger entant que Georges
    # aller sur la page new
    # rempli l'input name
    # rempli l'input tagline avec un message precis
    # submit
    # regarde si j'arrive sur l'index
    # regarde si le message est présent sur la page

  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"
    # save_and_open_screenshot
    
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"


  end

end
