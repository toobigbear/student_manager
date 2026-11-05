class Enrollment < ApplicationRecord
  belongs_to :student  # 这条选课记录 属于 一个学生
  belongs_to :course # 这条选课记录 属于 一门课程
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # 分数必须在 0~100 之间
end
