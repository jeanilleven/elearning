class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
end
