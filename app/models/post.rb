class Post < ApplicationRecord
  belongs_to :user

  # To show the most recent posts first
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true, length: {minimum: 4, maximum: 50 }
  validates :body, presence: true, length: {minimum: 3, maximum: 1000 }
end
