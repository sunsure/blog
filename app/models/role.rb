class Role < ActiveRecord::Base

  has_many :powers
  has_many :users, through: :powers

  validates :name,
    uniqueness: { case_sensitive: false },
    presence: true
  validates :key,
    uniqueness: { case_sensitive: false },
    presence: true

end
