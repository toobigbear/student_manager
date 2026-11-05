class Student < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0, less_than: 150 }

  def average_score
    enrollments.average(:score)&.round(2) || 0
  end

end
