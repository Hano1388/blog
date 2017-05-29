class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, optional: true

  validates :title, { presence: {message: "must be provided"},
                    uniqueness: true }
end
