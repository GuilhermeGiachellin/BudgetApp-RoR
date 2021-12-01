class Group < ApplicationRecord
  has_and_belongs_to_many :entities, dependent: :destroy
  belongs_to :user
end
