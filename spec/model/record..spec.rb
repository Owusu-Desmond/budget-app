require 'rails_helper'

RSpec.describe 'Records', type: :model do
  let(:user) do
    User.create!(name: 'test', email: 'testmodel1@gmail.com', password: '123456', password_confirmation: '123456')
  end

  let(:category) { Category.create!(name: 'Category 1', author_id: user.id) }

  let(:record) { Record.create!(name: 'Record 1', amount: 100, author_id: user.id) }

  it 'is valid with valid attributes' do
    expect(record).to be_valid
  end

  it 'is not valid without a name' do
    record.name = nil
    expect(record).to_not be_valid
  end

  it 'is not valid without an amount' do
    record.amount = nil
    expect(record).to_not be_valid
  end

  it 'is not valid without an author' do
    record.author_id = nil
    expect(record).to_not be_valid
  end
end
