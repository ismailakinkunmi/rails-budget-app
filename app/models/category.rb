class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :transaction

  validates :name, :icon, presence: true
end
