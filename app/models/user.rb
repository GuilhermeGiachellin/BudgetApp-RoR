class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :group, dependent: :destroy
  has_many :entity, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
