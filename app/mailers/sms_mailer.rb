class SmsMailer < ApplicationMailer
  def send_sms(phone_number, message)
    email_address = "#{phone_number}@txt.att.net"
    mail(:to => email_address, :from => 'noreply@example.com', :subject => 'Appointment Time') do |format|
      format.text { render :text => message }
    end
  end
end
