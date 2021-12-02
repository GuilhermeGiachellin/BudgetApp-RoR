class Entity < ApplicationRecord
  has_and_belongs_to_many :groups, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
