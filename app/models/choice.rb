class Choice < ApplicationRecord
  belongs_to :word

  #validations
  validates :content, presence: true, length: { minimum: 1 }
end
