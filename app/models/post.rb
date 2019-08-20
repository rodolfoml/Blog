class Post < ApplicationRecord
    has_many :comments, dependent: :delete_all

    validates :title, :content, presence: true
end
