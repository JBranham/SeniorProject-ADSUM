class AbsentLimitNotify < ActionMailer::Base

  def exceeded(user)
    
    recipients  user.email
    from        "ADSUM"
    subject     "ADSUM notification"
    body        :user => user, :student => student
  end
end
