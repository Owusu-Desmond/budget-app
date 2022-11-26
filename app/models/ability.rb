class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Category, author_id: user.id
    can :create, Category
    can :destroy, Category, author_id: user.id

    can :read, Record, author_id: user.id
    can :create, Record
    can :destroy, Record, author_id: user.id
  end
end
