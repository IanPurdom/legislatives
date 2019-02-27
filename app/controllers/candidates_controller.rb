class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy, :poster, :validate, :reject, :attach, :remove_attachment, :remove_kits_attachment, :remove_documents_attachment]

  def index
    if params[:query].nil? && params[:department].nil? && params[:status].nil?
      @candidates = policy_scope(Candidate)
      respond_to do |format|
        format.html {render}
      end
    else
      @candidates = policy_scope(Candidate) if params[:query].blank?
      unless params[:query].blank?
        if ['COM','DNF'].include? current_user.role.code
          @candidates = Candidate.global_search(params[:query])
        else
          @candidates = Candidate.global_search(params[:query]).where(district: District.where(department: current_user.department))
        end
      end
      @candidates = @candidates.where(district: District.where(department: Department.find_by(name_code:params[:department]))) unless params[:department].blank?
      @candidates = @candidates.where(status: Status.find(params[:status])) unless params[:status].blank?
      respond_to do |format|
        format.js { render partial: 'search-results' }
        format.html { render }
      end
    end
  end

  def show
    authorize @candidate
  end

  def new
    @districts = District.where(department: current_user.department)
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    @candidate.election = Election.find_by(name:'Législatives')
    @candidate.picture.attach(candidate_params[:picture]) unless candidate_params[:picture].nil?
    authorize @candidate
    if @candidate.save
      unless deputy_params[:last_name].empty?
        deputy = Deputy.new(deputy_params)
        deputy.candidate = @candidate
        deputy.save
      end
      redirect_to candidate_path(@candidate)
    else
      flash[:alert] = "#{@candidate.errors.full_messages.to_sentence}"
      redirect_to new_candidate_path
    end
  end

  def edit
    @districts = District.where(department: current_user.department)
  end

  def update
    authorize @candidate
    @candidate.update(candidate_params)
    @candidate.picture.attach(candidate_params[:picture]) unless candidate_params[:picture].nil?
    if @candidate.save
      @candidate.deputy.update(deputy_params)
      if @candidate.deputy.save
          redirect_to candidate_path(@candidate)    
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
    poster.attach
  end

  def validate
    authorize @candidate
    @candidate.status = Status.find_by(order: (@candidate.status.order + 1))
    Audit.create!(action: 'validate', candidate: @candidate, status: (@candidate.status) , user: current_user, validation_date: Time.now) if @candidate.save
    poster if @candidate.status.code == 'PENDING_COM'
    redirect_to candidate_path(@candidate)
  end

  def reject
    authorize @candidate
    @candidate.status = Status.find_by(order: (@candidate.status.order - 1)) 
    Audit.create!(action: 'reject', candidate: @candidate, status: (@candidate.status) , user: current_user, validation_date: Time.now) if @candidate.save
    redirect_to candidate_path(@candidate)
  end

  def attach
    doc_type = candidate_params[:doc_type]
    @candidate.send("#{doc_type}").attach(candidate_params[doc_type])
    redirect_to candidate_path(@candidate) 
  end

  def remove_attachment
    doc_type = params[:doc_type]
    @candidate.send("#{doc_type}").find(params[:attachment]).purge
    redirect_to candidate_path(@candidate) 
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :district_id, :profession, :address, :mandate, :picture, :department, :status, :attachment, :doc_type ,documents: [], kits: [], query: [])
  end

  def deputy_params
    params.require(:candidate).require(:deputy).permit(:first_name, :last_name, :profession, :email, :address)
  end

  def user_params
    params.require(:candidate).require(:user).permit(:first_name, :last_name, :email)
  end


end
