class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  validates :title, { presence: {message: "must be provided"},
                    uniqueness: true }
end
