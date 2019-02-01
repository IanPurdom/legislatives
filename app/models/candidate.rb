class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :secretary, :class_name => 'User', :foreign_key => :secretary_id
  belongs_to :election
  has_one :deputy, dependent: :destroy
  accepts_nested_attributes_for :deputy
  validates :district, presence: true
end
