class Election < ApplicationRecord
  has_many :candidates
  validates :name, presence: true
  validates :election_date, presence: true
end
