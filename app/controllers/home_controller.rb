class HomeController < ApplicationController
    def index
		@pages = Page.find(:all, :order => 'page_order')
		@key_categories = Category.find(:all, :conditions => { :active => 1 }, :order => 'category_order ASC')
		@categories = Category.find(:all, :conditions => { :active => 1 }, :order => 'category_order DESC')				
	end
	
	def page
		@pages = Page.find(:all, :order => 'page_order')
		@page =  Page.find_by_urlname(params[:id])
		@prices = Price.find(:all, :order => 'position')
	end
	
	def gallery
		@pages = Page.find(:all, :order => 'page_order')
		@categories = Category.find(:all, :order => 'category_order DESC')	
		@category = Category.find_by_urlname(params[:id])	
		@photos = Photo.find(:all, :conditions => { :category_id => @category.id }, :order => 'photo_order')
	end
end
