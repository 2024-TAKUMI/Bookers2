class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :author
      can [:edit, :update, :destroy], Post, user_id: user.id
    end
  end
end