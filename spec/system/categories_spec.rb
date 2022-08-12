require 'rails_helper'

RSpec.describe 'CategoriesIndexPage', type: :feature do
  before(:each) do
    @user = User.new(name: 'Testing', email: 'user@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Category.new(name: 'Food', icon: 'icon', user: @user)
    @category.save
    visit categories_path
  end
  it 'shows page title' do
    expect(page).to have_content 'Categories'
  end
  it 'renders category name' do
    expect(page).to have_content @category.name
  end 

end


RSpec.describe 'CategoriesNewPage', type: :feature do
  before(:each) do
    @user = User.new(name: 'Testing', email: 'user@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Category.new(name: 'Food', icon: 'icon', user: @user)
    @category.save
    visit new_category_path
  end
  it 'shows page title' do
    expect(page).to have_content 'New Categories'
  end
  it 'renders label Icon' do
    expect(page).to have_content 'Icon'
  end
  it 'renders label Name' do
    expect(page).to have_content 'Name'
  end    
  
end
