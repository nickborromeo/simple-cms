class SectionsController < ApplicationController
	
	layout 'admin'
	
	before_filter :confirm_logged_in, :only => [:index, :menu] 
	
	def index
		list
		render('list')
	end
	
	def list
		@sections = Section.order("sections.position ASC")
	end
	
	def show
		@section = Section.find(params[:id])
	end
	
	#CREATE SECTIONS
	
	def new
		@section = Section.new 
		@section_count = Section.count + 1
		@pages = Page.order("position ASC")
	end
	
	def create
		@section = Section.new(params[:section])
		@section.save
		if @section.save
			flash[:notice] = "Section Created"
			redirect_to(:action => 'list')
		else
			@section_count = Section.count + 1
			@pages = Page.order("position ASC")
			render('new')
		end
	end
	
	#UPDATE SECTIONS
	
	def edit
		@section = Section.find(params[:id])
		@section_count = Section.count
		@pages = Page.order("position ASC")
	end
	
	def update
		@section = Section.find(params[:id])
		
		if @section.update_attributes(params[:section])
			flash[:notice] = "Section Created"
			redirect_to(:action => 'list')
		else
			@section_count = Section.count
			@pages = Page.order("position ASC")
			render('edit')
		end
	end
	
	#DELETE def SECTIONS
	#by pass delete - automatically destroy
	
	def destroy
		Section.find(params[:id]).destroy
		flash[:notice] = "Section destroyed"
		redirect_to(:action => 'list')
	end
	
	
	
end
