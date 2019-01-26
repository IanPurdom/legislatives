class CandidatesController < ApplicationController
  def index
    @candidates = Candidates.all
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
