class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy, :poster] 

  def index
    @candidates = Candidates.all
  end

  def show
  end

  def new
    @candidate = Candidate.new
    @deputy = Deputy.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    @candidate.election = Election.find_by(name:'Législatives')
    @candidate.save
    unless deputy_params[:first_name].empty?
      deputy = Deputy.new(deputy_params)
      deputy.candidate = @candidate
      deputy.save
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def poster
    poster = PosterService.new(@candidate)
    poster.create
    render :show
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :district, :profession)
  end

  def deputy_params
    params.require(:candidate).require(:deputy).permit(:first_name, :last_name, :profession, :email, :address)
  end

end
