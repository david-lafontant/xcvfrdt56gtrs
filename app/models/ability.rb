# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?

    user ||= User.new
    can :read, Certificate
    cannot %i[create update destroy], Certificate
    can(%i[read update], User, user:)
    cannot %i[create destroy], User

    if user.admin?
      can %i[read create update], Certificate
      cannot %i[destroy], Certificate
      can(%i[create read update], User, user:)
      cannot %i[destroy], User
    end

    return unless user.sysadmin?

    can :manage, :all




  end
end
