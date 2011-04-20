class Photo < ActiveRecord::Base
#	cattr_reader :per_page
#    @@per_page = 12
    
	has_attachment 	:content_type => :image, 
                 	:storage => :file_system,
                 	:path_prefix => 'public/system/photos',
                 	:max_size => 1.megabyte,
                 	:resize_to => '700x466>',
                 	:processor => :rmagick,
                 	:thumbnails => { 
                 		:thumb => '150x150>',
                 		:cropped => '48x48!' }
					
	validates_as_attachment
end
