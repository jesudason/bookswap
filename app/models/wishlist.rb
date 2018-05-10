class Wishlist < ApplicationRecord
  # belongs_to :book
  has_many :books
  belongs_to :user
end
