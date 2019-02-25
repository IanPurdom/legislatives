class Candidate < ApplicationRecord
  # before_validation :set_department 
  before_validation :set_status, if: :status_nil?
  has_one_attached :picture
  has_many_attached :documents
  has_many_attached :kits
  belongs_to :user
  belongs_to :district
  # belongs_to :secretary, :class_name => 'User', :foreign_key => :secretary_id
  belongs_to :election
  belongs_to :status
  has_many :audits
  has_one :deputy, dependent: :destroy
  accepts_nested_attributes_for :deputy
  validates :district, presence: true

  attr_accessor :attachment, :doc_type


  include PgSearch
  pg_search_scope :global_search,
    against: [ :profession, :mandate ],
    associated_against: {
      user:  [:first_name, :last_name]    
    },
    using: {
      tsearch: { prefix: true}
    }


 private

  def status_nil? 
    self.status.nil?
  end

  # def set_department
  #   self.department = user.department
  # end

  def set_status
    self.status = Status.find_by(code: "OPEN")
  end

end
