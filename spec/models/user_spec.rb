require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
