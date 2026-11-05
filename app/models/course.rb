class Course < ApplicationRecord
  has_many :enrollments   # 一门课 有多条 选课记录
  has_many :students, through: :enrollments # 一门课 通过选课记录 有多个学生

  validates :name, presence: true
  validates :credit, numericality: { greater_than: 0 }  # 学分必须大于 0
end
