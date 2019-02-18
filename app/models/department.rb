class Department < ApplicationRecord
	has_many :users
	has_many :candidates

  def self.search(code)
    if code
      where('code ILIKE ?', "#{code}")
    else
      all
    end
  end

end
