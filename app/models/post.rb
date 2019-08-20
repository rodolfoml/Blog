class Post < ApplicationRecord
    has_many :comments, dependent: :delete_all

    validates :title, length: { maximum: 50 }, presence:true 
    validates :content, length: { maximum: 500 }, presence: true
end
