class District < ApplicationRecord
  belongs_to :department
  has_one :candidate
end
