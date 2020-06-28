class Article < ApplicationRecord
    belongs_to :category
    belongs_to :account
    belongs_to :group
    belongs_to :disclosureRange
    has_rich_text :content
    paginates_per 5
    mount_uploader :image, ImageUploader
  #  enum disclosureRange_id: {外部公開:1, 社外秘:2, 管理者のみ:3}
end
