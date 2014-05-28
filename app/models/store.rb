class Store < ActiveRecord::Base
	has_attached_file :image
	self.per_page = 3
end
