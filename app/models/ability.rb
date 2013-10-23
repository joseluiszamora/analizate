class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    elsif user.is_medical?
      can :manage, Analysis, doctor_id: user.id
      cannot [:destroy], Analysis
      cannot :manage, User
    elsif user.is_patient?
      can [:read], Analysis, patient_id: user.id
    end
  end
end
