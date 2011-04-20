class Category < ActiveRecord::Base	
	
	acts_as_urlnameable :title, :validate => false

	
	has_attachment 	:content_type => :image, 
                 	:storage => :file_system, 
                 	:path_prefix => 'public/system/categories',
                 	:max_size => 500.kilobytes,
                 	:resize_to => [700, 466],
                 	:thumbnails => { :thumb => [100, 67] }
					
	validates_as_attachment
	
	def to_param

    urlname

	end
	
end
