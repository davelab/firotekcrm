class UserMailer < ActionMailer::Base
  default from: "commerciale@firotek.it"

  def new_task_assigned(user_email)
      mail(:to => user_email, :subject => "[FirotekCRM] Nuovo task assegnato")
  end
end
