class Word < ApplicationRecord
  belongs_to :category

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  has_one :correct_choice, -> { where isCorrect: true }, class_name: "Choice"

  #validations
  validates :content, presence: true, length: { minimum: 3 }
  validate :has_one_correct_choice
  validate :unique_choices

  def has_one_correct_choice
    len = choices.select{|choice| choice.isCorrect }.length
    if len > 1
      return errors.add :base, "A Word can contain ONLY ONE correct answer!"
    elsif len == 0
      return errors.add :base, "A Word SHOULD HAVE ONE correct answer!"
    end
  end

  def unique_choices
    if choices.select{|x| choices}.uniq {|c| [c.content.downcase]}.length < choices.length
      return errors.add :base, "Choices should be unique."
    end
  end
end
