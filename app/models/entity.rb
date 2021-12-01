class Entity < ApplicationRecord
  has_and_belongs_to_many :groups, dependent: :destroy
  belongs_to :user
end
