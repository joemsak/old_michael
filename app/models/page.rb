class Page < ActiveRecord::Base
	acts_as_urlnameable :title, :validate => false
	validates_presence_of :title, :content, :page_order
	validates_uniqueness_of :page_order
	
	def to_param

    urlname

	end
end
