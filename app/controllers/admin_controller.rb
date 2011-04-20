class AdminController < ApplicationController
  before_filter :login_required
  uses_tiny_mce :options => {
					:theme => 'advanced',
					 :theme_advanced_buttons1 => 'bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,separator,bullist,numlist,separator,image',
					 :theme_advanced_buttons2 => '',
					 :theme_advanced_buttons3 => '',
					:theme_advanced_toolbar_location => 'top',
					:plugins => %w{ table fullscreen }
				}
  
  def index
  	@pages = Page.find(:all, :order => 'page_order')
  end
  

  def list_pages
  	@pages = Page.find(:all, :order => 'page_order')
  end

  def add_page
  	@page = Page.new
  	@maximum_page_order = 0
  	@maximum_page_order = Page.maximum('page_order') + 1 unless Page.maximum('page_order').nil?
  end
  
  def create_page
        @page = Page.new(params[:pages])
        success = @page && @page.save
        if success && @page.errors.empty?
            flash[:notice] = "<p class='success'>Your page was created!</p>"
            redirect_to :action => 'list_pages'
        else
            render :action => :add_page
        end
  end

  def edit_page
  	@page = Page.find(params[:id])
  	@maximum_page_order = @page.page_order
  end
  
  def update_page
  	@page = Page.find(params[:id])
	if @page.update_attributes(params[:pages])
	  flash[:notice] = '<p class="success">Your page was successfully updated!</p>'
	  redirect_to :action => 'list_pages'
	else
	  render :action => :edit_page
	end
  end

  def delete_page
  	Page.find(params[:id]).destroy
    flash[:notice] = '<p class="error">The page was deleted.</p>'
    redirect_to :action => 'list_pages'
  end

  def list_categories
  	@categories = Category.find(:all, :order => 'category_order DESC')
  end

  def add_category
  	@category = Category.new 	
  	@maximum_category_order = 0
  	@maximum_category_order = Category.maximum('category_order') + 1 unless Category.maximum('category_order').nil?
  end

  def create_category
  	 @category = Category.new(params[:categories])
     success = @category && @category.save
     if success && @category.errors.empty?
        flash[:notice] = "<p class='success'>Your category was added!</p>"
        redirect_to :action => 'list_categories'
     else
        render :action => :add_category
     end
  end

  def edit_category
  	@category = Category.find(params[:id])
  	@maximum_category_order = @category.category_order
  end
  
  def update_category
  	@category = Category.find(params[:id])
	if @category.update_attributes(params[:categories])
	  flash[:notice] = '<p class="success">Your category was successfully updated!</p>'
	  redirect_to :action => 'list_categories'
	else
	  render :action => :edit_category
	end
  end
  
  def update_category_sort_order
	 params[:sortable_category_list].each_with_index do |id, category_order|
  	Category.update(id, :category_order => category_order)
	 end
 	 render :nothing => true
  end

  def delete_category
  	Category.find(params[:id]).destroy
    flash[:notice] = '<p class="error">The category was deleted.</p>'
    redirect_to :action => 'list_categories'
  end
  
  def activate_category
  	if Category.count(:all, :conditions => { :active => 1 }) == 7
   		flash[:notice] = '<p class="error">You can only activate 7 categories. Please deactivate another category first.'
    	redirect_to :action => 'list_categories'
  	else
    	Category.update(params[:id], :active => 1)
    	flash[:notice] = '<p class="success">Your category was activated.</p>'
  		redirect_to :action => 'list_categories'
    end
  end
  
  def deactivate_category
    Category.update(params[:id], :active => 0)
    flash[:notice] = '<p class="success">Your category was deactivated.</p>'
  	redirect_to :action => 'list_categories'
  end

  def list_photos
  	@photos = Photo.find(:all, :conditions => { :category_id => params[:id] },  :order => 'photo_order')
  	@categories = Category.find(:all)
  	@category_list = Category.find(:all, :conditions => [ 'title IS NOT NULL' ]).collect {|c| [ c.title, c.id ]}
  	@photo_categories = Category.find(:all, :conditions => { :id => params[:id] }) unless params[:id].nil?
  	@default_upload_category = ''
  	@default_upload_category = Category.find(params[:id]) unless params[:id].nil?
  end

  def add_photo
  	@categories = Category.find(:all)	
  	@photo = Photo.new
  end

  def upload_photo
  	 @photo = Photo.new(params[:photo])
     success = @photo && @photo.save
     if success && @photo.errors.empty?
        flash[:notice] = "<p id='success'>Your photo was uploaded!</p>"
        redirect_to :action => 'list_photos', :id => @photo.category_id
     else
        render :action => :add_category
     end
  end

  def delete_photo
  	Photo.find(params[:id]).destroy
    flash[:notice] = '<p id="error">The photo was deleted.</p>'
    redirect_to :action => 'list_photos', :id => params[:category_id]
  end
  
  def update_photo_sort_order
  	  params[:photo_list].each_with_index do |id, photo_order|
    	Photo.update(id, :photo_order => photo_order)
  	  end
 	  render :nothing => true
  end

  def list_prices
  	@prices = Price.find(:all, :order => 'position')
  end
  
  def update_price_sort_order
	  params[:price_list_sortable].each_with_index do |id, item_order|
  		Price.update(id, :position => item_order)
	  end
 	  render :nothing => true
  end

  def add_price
  	@price = Price.new
  end
  
  def create_price
  	@price = Price.new(params[:prices])
  	success = @price && @price.save
     if success && @price.errors.empty?
        flash[:notice] = "<p class='success'>Your price was added!</p>"
        redirect_to :action => 'list_prices'
     else
        render :action => :add_price
     end
  end
  
  def edit_price
  	@price = Price.find(params[:id])
  end

  def update_price
  	@price = Category.find(params[:id])
	if @price.update_attributes(params[:prices])
	  flash[:notice] = '<p class="success">Your price was successfully updated!</p>'
	  redirect_to :action => 'list_prices'
	else
	  render :action => :edit_price
	end
  end

  def delete_price
  	Price.find(params[:id]).destroy
    flash[:notice] = '<p class="error">The price was deleted.</p>'
    redirect_to :action => 'list_prices'
  end
  
  def add_upload
    render :layout => 'blank'
  	@upload = Upload.new
  end
  
  def upload_upload
  	 @upload = Upload.new(params[:upload])
     success = @upload && @upload.save
     if success && @upload.errors.empty?
        redirect_to :action => 'show_upload', :id => @upload.id
     else
        render :action => :add_upload, :layout => 'blank'
     end
  end
  
  def show_upload
   	@uploaded_upload = Upload.find(params[:id])
	render :layout => 'blank'
  end

end
