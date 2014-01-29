class GoController < ApplicationController

	# loads the home page, will show a list of search results
	def index
		@urls = Url.all
		render :index  #shows all urls
	end


	# creates the search form
	def new
		@url = Url.new #makes now Url model and renders new.html.erb
	end

	# creates loads the search field and generates the witly link
	def create
		new_url = params.require(:url).permit(:input) #diving into the params hash, url, then into input
		code = SecureRandom.urlsafe_base64(6)
		linklist = {}
		linklist["input"] = new_url["input"] #extracting out of new_url input hsat
		linklist["code"] = code #putting into the key 'code'
		@url = Url.create(linklist)
		redirect_to new_url_path(@url.id) #now created, redirect to controller that takes you to show

	end

	def edit
		id = params[:id]
		@url = Url.find(id)
	end

	def update
		id = params[:id]
		updated_info = params.require(:url).permit(:url,:input)
		@url= Url.find(id)
		@url.update_attributes(updated_info)
		#redirect_to all_path(@url.id) # this is to redirect back to the index
		redirect_to new_url_path(@url.id)

	end

	def show
		id = params[:id]
		@url = Url.find(id)
	end

	def destroy
		id = params[:id]
		@url = Url.find(id).destroy #crashes here
		redirect_to "all_path"
	end


end
