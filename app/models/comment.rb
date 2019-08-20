class Comment < ApplicationRecord
    belongs_to :post

    validates :post_id, :content, presence: true
end
