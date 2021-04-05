class User < ApplicationRecord
  has_many :tasks

  validates :email, presence: true, uniqueness: true
end
