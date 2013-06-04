class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

  end

  def admin
    can :manage, :all
    can :view_all_records
    can :export_xls, :all

  end

  def supervisor
    can  :read, :all
    can :view_all_records
    cannot :export_xls, :all
  end


  def seller
    can :manage, :all
    cannot [:create, :edit, :destroy], Deal
    cannot :destroy, :all
    cannot :view_all_records
    cannot :view_all_deals
    cannot :export_xls, :all
    cannot :show, Company do |company|
      !company.user_ids.include? @user.id
    end

  end 

  def superseller
    can :manage, :all
    cannot :view_all_records
    cannot :destroy, :all
    cannot :view_all_deals
    cannot :export_xls, :all
    can :read, Deal
  end

  def technician
    can :manage, Report
  end
end