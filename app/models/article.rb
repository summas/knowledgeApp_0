class Article < ApplicationRecord
    belongs_to :category
    has_rich_text :content
    paginates_per 10
end
