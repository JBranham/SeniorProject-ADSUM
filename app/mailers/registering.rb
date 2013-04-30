class Registering < ActionMailer::Base
    default :from => "ADSUM"
    
    def registration_confirmation(user)
      @user = user
      @url  = "adsum2.herokuapp.com"
      mail to: user.email, subject: 'ADSUM registration confirmation'
    end
    
end
