class Article < ApplicationRecord
    belongs_to :category
    belongs_to :account
    belongs_to :group
    belongs_to :disclosureRange
    has_rich_text :content
    paginates_per 5
end
