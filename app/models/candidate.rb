class Candidate < ApplicationRecord
  has_many_attached :documents
  has_many_attached :kits
  belongs_to :user
  belongs_to :secretary, :class_name => 'User', :foreign_key => :secretary_id
  belongs_to :election
  belongs_to :status
  has_many :audits
  has_one :deputy, dependent: :destroy
  accepts_nested_attributes_for :deputy
  validates :district, presence: true
end
