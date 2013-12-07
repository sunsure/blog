class User < ActiveRecord::Base

  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :powers
  has_many :roles, through: :powers

end
