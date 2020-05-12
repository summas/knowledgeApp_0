class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  has_many :groupRelations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
end
