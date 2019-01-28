class PosterService
  def initialize(candidate)
    @first_name = candidate.first_name
    @last_name = candidate.last_name
    @profession = candidate.profession
    @district = candidate.district
  end

  def create
    raise
    # copy idml file
    # unzip copied idml file
    # unparse file for first_name
    # modify 
  end
end