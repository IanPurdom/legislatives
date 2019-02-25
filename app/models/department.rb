class Department < ApplicationRecord
	has_many :users
	has_many :districts
	has_many :candidates, through: :districts

  def self.search(code)
    if code
      where('code ILIKE ?', "#{code}")
    else
      all
    end
  end

end
