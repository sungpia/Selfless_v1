module V1
	class CharityController < ApplicationController
		def show
			charity = Charity.find(params[:id])
			if params[:admin_token] == "admintokenbitch" 
				render json: charity, status: 200
			else
				render nothing: true, status: 401
			end
		end
		def create
			puts params[:admin_token]
			if params[:admin_token] == "admintokenbitch"
				charity = Charity.new
				charity.name = params[:name]
				charity.website = params[:website]
				charity.save
				render json: charity, status: 200
			else
				render nothing: true, status: 401
			end
		end
		def index
			if params[:admin_token] == "admintokenbitch"
				charities = Charity.all
				render json: charities, status: 200
			else
				render nothing: true, status: 401
			end
		end
		def update
			charity = Charity.find(params[:id])
			if params[:admin_token] == "admintokenbitch" 
				charity.name = params[:name]
				charity.website = params[:website]
				charity.save
				render json: charity, status: 200
			else
				render nothing: true, status: 401
			end
		end
		def destroy
			charity = Charity.find(params[:id])
			if params[:admin_token] == "admintokenbitch"
				charity.destroy
				render nothing: true, status: 200
			else
				render nothing: true, status: 401
			end
		end
	end
end
