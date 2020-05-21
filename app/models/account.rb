class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  has_many :groupRelations
  accepts_nested_attributes_for :groupRelations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  mount_uploader :aicon, AiconUploader
end
