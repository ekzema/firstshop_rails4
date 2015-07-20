class MyMailer < Devise::Mailer
 
    def confirmation_instructions(record, token, opts={})
     @token = token
      devise_mail(record, :confirmation_instructions, opts={:to => "xxx.zp@mail.ru"})
    end
  
  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end
  
  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end
    
end
