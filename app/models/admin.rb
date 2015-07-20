class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable, :lockable

  validates :name, presence: true, uniqueness: true
  
end
