class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

    
  end

  def admin
    can :manage, :all
  end

  def supervisor
    
    can  :read, :all
  end

  def seller
    cannot :destroy,  :all
  end 

  def superseller
    cannot :destroy, :all
  end
end