require 'rails_helper'

RSpec.describe "Transactions", type: :feature do
  before(:each) do
    @user = User.new(name: 'Testing', email: 'user@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Category.new(name: 'Food', icon: 'icon', user: @user)
    @category.save
    visit category_transactions_path(@category)
  end

  it 'renders transaction title' do
    expect(page).to have_content 'Transactions'
  end

  it 'renders new transaction' do
    expect(page).to have_content 'New transaction'
  end

  it 'renders back to categories' do
    expect(page).to have_content 'Back to categories'
  end

  it 'renders total amount' do
    expect(page).to have_content 'Total'
  end

end

RSpec.describe "Transactions", type: :feature do
  before(:each) do
    @user = User.new(name: 'Testing', email: 'user@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Category.new(name: 'Food', icon: 'icon', user: @user)
    @category.save
    visit new_category_transaction_path(@category)
  end

  it 'renders transaction title' do
    expect(page).to have_content 'New Transaction'
  end

  it 'renders Transaction amount' do
    expect(page).to have_content 'Amount'
  end

  it 'renders Back to transaction' do
    expect(page).to have_content 'Back to transaction'
  end

  it 'renders Back to transaction' do
    expect(page).to have_content @category.name
  end

end

