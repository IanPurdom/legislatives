class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy, :poster, :validate, :reject]

  def index 
    @candidates = policy_scope(Candidate)
    @statuses_ids = @candidates.distinct.pluck(:status_id)
  end

  def show
    authorize @candidate
  end

  def new
    @candidate = Candidate.new
    @deputy = Deputy.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    @candidate.election = Election.find_by(name:'Législatives')
    authorize @candidate
    if @candidate.save
      unless deputy_params[:last_name].empty?
        deputy = Deputy.new(deputy_params)
        deputy.candidate = @candidate
        deputy.save
      end
      redirect_to candidate_path(@candidate)
    else
     render :new 
    end
  end

  def edit
  end

  def update
    authorize @candidate
    @candidate.update(candidate_params)
    if @candidate.save
      @candidate.deputy.update(deputy_params)
      if @candidate.deputy.save
        @candidate.user.update(user_params)
        if @candidate.user.save
          redirect_to candidate_path(@candidate)    
        else
          render :new
        end 
      else
        render :new
      end
    else 
      render :new
    end  
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path
  end

  def poster
    poster = PosterService.new(@candidate)
    poster.create
    render :show
  end

  def validate
    authorize @candidate
    @candidate.status = Status.find_by(order: (@candidate.status.order + 1))
    Audit.create!(action: 'validate', candidate: @candidate, status: (@candidate.status) , user: current_user, validation_date: Time.now) if @candidate.save
    redirect_to candidate_path(@candidate)
  end

  def reject
    authorize @candidate
    @candidate.status = Status.find_by(order: (@candidate.status.order - 1))
    Audit.create!(action: 'reject', candidate: @candidate, status: (@candidate.status) , user: current_user, validation_date: Time.now) if @candidate.save
    redirect_to candidate_path(@candidate)
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

  def user_params
    params.require(:candidate).require(:user).permit(:first_name, :last_name, :email)
  end

end
