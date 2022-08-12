require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(email: 'test@gmail.com', password: 'password', name: 'ismail') }

  subject do
    described_class.new(name: 'ismail', icon: 'ismail icon', user_id: user.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
