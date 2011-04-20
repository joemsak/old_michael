class Upload < ActiveRecord::Base
	has_attachment 	:content_type => :image, 
                 	:storage => :file_system, 
                 	:path_prefix => 'public/system/uploads',
                 	:max_size => 1.megabyte,
                 	:resize_to => '640x480>',
                 	:processor => :rmagick,
                 	:thumbnails => { 
                 		:thumb => '150x150!' }
					
	validates_as_attachment
end
