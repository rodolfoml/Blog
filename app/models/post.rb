class Post < ApplicationRecord
    extend FriendlyId
    has_many :comments, dependent: :delete_all

    friendly_id :title, use: :slugged

    validates :title, length: { maximum: 50 }, presence:true 
    validates :content, length: { maximum: 500 }, presence: true
end
