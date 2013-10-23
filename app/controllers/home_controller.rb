class HomeController < ApplicationController
	layout "frontend"
	def index
		@services = Service.all
	end
end
