class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :activity, optional: true

  has_many :answers, dependent: :destroy
  has_many :words, through: :category

  has_one :activity, as: :action, dependent: :destroy
end
