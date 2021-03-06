class User < ApplicationRecord
  has_many :resumes
  has_many :feedback, through: :resumes
  has_many :comments, foreign_key: "poster_id"

  validates :name, presence: true
  validates :email, presence: true
end
