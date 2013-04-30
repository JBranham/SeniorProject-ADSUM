class Registering < ActionMailer::Base
    default :from => "ADSUM"
    
    def registration_confirmation(user)
      @user = user
      @url  = ""
      mail to: user.email, subject: 'ADSUM registration confirmation'
    end
    
end
