require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  @user = User.create!(name: 'test', email: 'category2@gmail.com', password: '123456',
                       password_confirmation: '123456')
  Category.create!(name: 'Category 1', author_id: @user.id)
  Category.create!(name: 'Category 2', author_id: @user.id)

  # display categories after login

  it 'display categories after login' do
    visit new_user_session_path
    fill_in 'Email', with: 'category2@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    visit categories_path
    expect(page).to have_content('Category 1')
    expect(page).to have_content('Category 2')
  end
end
