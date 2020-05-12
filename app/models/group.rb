class Group < ApplicationRecord
    has_many :articles
    has_many :groupRelations
end
