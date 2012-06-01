class Section < ActiveRecord::Base
	
	#relationships
	belongs_to :page
	has_many :section_edits
	has_many :editors, :class_name => "AdminUser", :through => 	:section_edits
	
	CONTENT_TYPES = ['text', 'HTML']
  
  	validates_presence_of :name
  	validates_length_of :name, :maximum => 255
 	validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  	validates_presence_of :content
  
end
