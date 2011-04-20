class Notifications < ActionMailer::Base
  def question(email_params, sent_at = Time.now)
  	puts "Sent from -> #{email_params[:address]}"
    subject "From your website: " << email_params[:subject]
    recipients "info@michaelyoungblood.com" # Perhaps your address here?
    from email_params[:address]
    sent_on sent_at

    # allows access to @message and @sender_name
    # in the view
    body :sender_email => email_params[:address], :message => email_params[:body], :sender_name => email_params[:name]
  end

end
