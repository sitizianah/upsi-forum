class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.admin?
        can :manage, :all
    else
        can :update, Question, user_id: user.id
        can :destroy, Question, user_id: user.id
        
        can :read, Question
        can :create, Question

        can :destroy, Answer, user_id: user.id
        can :read, Answer
        can :create, Answer

        can :destroy, Contact, user_id: user.id
        can :read, Contact
        can :create, Contact
    end
  end
end