class Subject < ActiveRecord::Base
	
	#relationships
	has_many :pages
	
	#validations
	validates_presence_of :name
	validates_presence_of :name, :maximum => 255
	
	#scopes
	scope :visible, where(:visible => true)
	scope :invisible, where(:visible => false)
	scope :search, lambda{|query| where(["name LIKE ?", "%#{query}%"])}
end
