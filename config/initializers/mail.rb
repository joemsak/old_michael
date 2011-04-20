require 'smtp_tls'

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  # :domain => "robseaman.com", # HELO domain (not req'd)
  :authentication => :plain,
  :user_name => "joe@joesak.com",
  :password => "qrx2va"
}