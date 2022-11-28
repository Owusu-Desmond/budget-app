require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create!(name: 'test', email: 'testrequest2@gmail.com', password: '123456',
                           password_confirmation: '123456')

      @category1 = Category.create!(name: 'Category 1', author_id: @user.id)
      @category2 = Category.create!(name: 'Category 2', author_id: @user.id)

      @record1 = Record.create!(name: 'Record 1', amount: 100, author_id: @user.id)
      @record2 = Record.create!(name: 'Record 2', amount: 200, author_id: @user.id)

      @record1.categories << @category1
      @record2.categories << @category2
    end

    it 'returns http success after login' do
      get category_records_path(@category1.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template after login' do
      get category_records_path(@category1.id)
      expect(response).to render_template('index')
    end
  end
end
