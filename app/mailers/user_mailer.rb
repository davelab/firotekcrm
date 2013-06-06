class UserMailer < ActionMailer::Base
  default from: "info@firotek.it"

  def new_task_assigned(user_email, owner, description)
    @owner = owner
    @description = description
      mail(:to => user_email, :subject => "[FirotekCRM] Nuovo task assegnato")
  end
end
