require 'rails_helper'


RSpec.describe 'Records', type: :system do
    @user = User.create!(name: 'test', email: 'record2@gmail.com', password: '123456', password_confirmation: '123456')
    category1 = Category.create!(name: 'Category 1', author_id: @user.id)
    category2 = Category.create!(name: 'Category 2', author_id: @user.id)
    @categories = Category.where(id: [category1.id, category2.id])
    record1 = Record.create!(name: 'Record 1', amount: 100, author_id: @user.id)
    record2 = Record.create!(name: 'Record 2', amount: 200, author_id: @user.id)

    record1.categories << @categories
    record2.categories << @categories

    # display records after login

    it 'display records after login' do
        visit new_user_session_path
        fill_in 'Email', with: "record2@gmail.com"
        fill_in 'Password', with: "123456"
        click_on 'Log in'
        visit category_records_path(category1.id)
        expect(page).to have_content('Record 1')
        expect(page).to have_content('Record 2')
    end
end