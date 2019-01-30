class Deputy < ApplicationRecord
  belongs_to :candidate
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :candidate_id, presence: true
end
