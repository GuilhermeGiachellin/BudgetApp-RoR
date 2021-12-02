class User < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :group, dependent: :destroy
  has_many :entity, dependent: :destroy

  validates_presence_of :name  

  def expenses_sum_user
    entity.sum(:amount)
  end
  
end
