class Group < ApplicationRecord
  has_and_belongs_to_many :entities, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true

  def expenses_group_sum
    entities.sum(:amount)
  end
end
