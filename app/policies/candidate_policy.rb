class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role.code == 'CAN'
        scope.where(user: user)
      elsif user.role.code == 'SD'
        scope.where(secretary: user)
      else
        scope.all
      end
    end
  end

  def show?
    record.user == user || record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
  end

  def create?
    return true
  end

  def update?
    if record.status.code == 'OPEN'
      record.user == user || record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_SD'
      record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_DNF' 
      user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_COM'
      user.role.code == 'COM'
    else 
      return false    
    end
  end

  def destroy?
    record.user == user || record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
  end

  def validate?
    if record.status.code == 'OPEN'
      record.user == user || record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_SD'
      record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_DNF' 
      user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_COM'
      user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_CANDIDATE'
      record.user == user    
    end
  end

  def reject?
    if record.status.code == 'OPEN'
      record.user == user || record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_SD'
      record.secretary == user || user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_DNF' 
      user.role.code == 'DNF' || user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_COM'
      user.role.code == 'COM'
    elsif record.status.code  == 'PENDING_CANDIDATE'
      record.user == user    
    end
  end

  def attach?
    current_user.role.code == 'COM'
  end

  def remove_kits_attachment?
    current_user.role.code == 'COM'
  end

end
