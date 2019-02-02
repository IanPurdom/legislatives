class Status < ApplicationRecord
  has_many :candidates
  has_many :audits
end
