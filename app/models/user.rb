# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
