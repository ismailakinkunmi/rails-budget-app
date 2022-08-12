require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user){User.create(email: 'test@gmail.com', password:'password', name:'ismail')}
  let(:category){Category.create(name:'ismail', icon: 'icon', user_id: user.id )}
  
  subject{
    described_class.new(name: 'ismail', amount: 1000, user_id: user.id, category_id: category.id)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  
end
