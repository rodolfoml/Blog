class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates :post_id, presence: true
    validates :content, length: { maximum: 250 }, presence: true
end
