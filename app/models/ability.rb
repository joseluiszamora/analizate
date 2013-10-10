class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
    elsif user.is_medical?
      can :manage, Analysis, doctor_id: user.id
      cannot [:read, :update, :destroy], User
    elsif user.is_patient?
      can [:read], Analysis, patient_id: user.id
    end
  end
end
