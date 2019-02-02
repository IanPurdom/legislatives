class Audit < ApplicationRecord
  belongs_to :candidate
  belongs_to :status
  belongs_to :user
end
