module AdminHelper
  def is_active?(page_name)
    "here" if params[:action] == page_name
  end
end
