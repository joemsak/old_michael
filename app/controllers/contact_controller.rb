class ContactController < ApplicationController
  layout 'home'
  def index
    @pages = Page.find(:all, :order => 'page_order')
  end

  def send_mail
    Notifications.deliver_question(params[:email])
    flash[:notice] = "<p id='success'>Email was succesfully sent.</p>"
    redirect_to :action => "index"
  end
end
