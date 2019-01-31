class Deputy < ApplicationRecord
  belongs_to :candidate
  # belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
end
