class Word < ApplicationRecord
  belongs_to :category

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  has_one :correct_choice, -> { where isCorrect: true }, class_name: "Choice"

  #validations
  validates :content, presence: true, length: { minimum: 3 }
end
