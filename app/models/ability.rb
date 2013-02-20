class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

  end

  def admin
    can :manage, :all
    can :view_all_reports
  end

  def supervisor
    can  :read, :all

  end

  def seller
    can :manage, :all
    cannot :destroy, :all
    # can :index, Company do |company|
    #   company.user_ids.include? @user.id
    # end

  end 

  def superseller
    cannot :destroy, :all
  end
end