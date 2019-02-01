class User < ApplicationRecord
  has_one :candidate, dependent: :destroy
  has_one :deputy, through: :candidates
  has_many :candidates_as_secretary, :class_name => 'Candidate', :foreign_key => :secretary_id
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
