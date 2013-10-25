class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    elsif user.is_medical?
      can [:read, :create], Analysis, doctor_id: user.id
      can [:categories, :tests], Analysis
      cannot [:destroy, :update], Analysis
      can :profile, User, id: user.id
      cannot [:read, :create, :update, :destroy], User
    elsif user.is_laboratory_staff?
      can [:read, :create, :update], Analysis
      can :profile, User, id: user.id
    elsif user.is_patient?
      can :read, Analysis, patient_id: user.id
    end
  end
end
