module V1
	class UserController < ApplicationController
#		before_action :show, :update, :destroy

		def create
			user = User.new
			user.insta_id = params[:insta_id]
			user.insta_name = params[:insta_name]
			user.os_type = params[:os_type]
			user.push_id = params[:push_id]
			user.auths << Auth.new(auth_token: params[:auth_token])
			user.save

			render json: user, status: 201

		end

		def show
			user = User.find(params[:id])
			if user.auths.first.auth_token == params[:auth_token]
					render json: user, status: 200
			else
				render nothing: true, status: 401
			end
		end

		def update
			user = User.find(params[:id])
			if user.auths.first.auth_token == params[:auth_token]
				user.insta_id = params[:insta_id]
				user.insta_name = params[:insta_name]
				user.os_type = params[:os_type]
				user.push_id = params[:push_id]
				user.auth << Auth.new(auth_token: params[:auth_token])
				user.save
				render json: user, status: 200
			else
				render nothing: true, status: 401
			end
		end

		def destroy
			user = User.find(params[:id])
			if user.auths.first.auth_token == params[:auth_token]
				user.destroy
				render status: 204
			else
				render nothing: true, status: 401
			end
		end

		private


	end
end
