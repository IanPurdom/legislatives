class Department < ApplicationRecord
  belongs_to :user
  has_many :candidates
  validates :code, presence: true, uniqueness: true 
  validates :name, presence: true, uniqueness: true 

  def create(dept_code, user)
    depts= YAML.load(open('db/department.yml').read)
    dept_sd = dep.each_slice(2).to_a.select {|d| d.last == "#{dept_code}"}.flatten
    Department.create!(name: dept_sd.first, code: dept_sd.last, user: user)
  end
end
