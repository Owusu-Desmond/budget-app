require 'rails_helper'

RSpec.describe 'Categories', type: :model do
  let(:user) do
    User.create!(name: 'test', email: 'testmodel1@gmail.com', password: '123456', password_confirmation: '123456')
  end
  let(:category) { Category.create!(name: 'Category 1', author_id: user.id) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without an author' do
    category.author_id = nil
    expect(category).to_not be_valid
  end

  it 'is not valid with a name longer than 25 characters' do
    category.name = 'a' * 26
    expect(category).to_not be_valid
  end
end
