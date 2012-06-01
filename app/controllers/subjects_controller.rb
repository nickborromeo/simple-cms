class SubjectsController < ApplicationController
	
	layout 'admin'
	
	before_filter :confirm_logged_in, :only => [:index, :menu] 
	
	def index
		list
		render('list')
	end
	
	def list
		@subjects = Subject.order("subjects.position ASC")
	end
	
	def show
		@subject = Subject.find(params[:id])
	end
	
	def new
		@subject = Subject.new
		@subject_count = Subject.count + 1
		#if you want to put default values in your fields
		#@subject = Subject.new(:name => 'default')
	end
	
	def create
		
		# Instantiate a new object using form parameters
		@subject = Subject.new(params[:subject])
		# Save the object
		@subject.save
		# If save succeeds, redirect to the list action
		if @subject.save
			flash[:notice] = "Subject created" 
			redirect_to(:action => 'list')
		# If save fails, redisplay the form so user can fix problems
		else
			@subject_count = Subject.count + 1
			render('new')
		end
		
	end
	
	def edit
	
		@subject = Subject.find(params[:id])	
		@subject_count = Subject.count
			
	end
	
	def update
		# Find object using form parameters
		@subject = Subject.find(params[:id])
		# Save the object
		if @subject.update_attributes(params[:subject])
			# If update succeeds, redirect to the list action
			redirect_to(:action => 'show', :id => @subject.id)
		
		else
			# If update fails, redisplay the form so user can fix problems
			@subject_count = Subject.count
			render('edit')
		end
	end
	
	def delete
	
		@subject = Subject.find(params[:id])	
		
	end
	
	def destroy
	
		#long cut
		# subject = Subject.find(params[:id])
		# subject.destroy
			
		Subject.find(params[:id]).destroy
		flash[:notice] = "Subject destroyed" 
		redirect_to(:action => 'list')
	end
	
	
	
end
