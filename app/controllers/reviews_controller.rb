class ReviewsController < ApplicationController
	def review_params
		params.require(:review).permit(:id_user, :id_product, :content, :grade)
	end

	def index
		if user_signed_in?
			if current_user.admin?
				@reviews = Review.all
				render "index_admin"

			else
				@reviews = Review.where(id_user: current_user.id)

			end
		else
			redirect_to "/"
		end
	end

	def create
		@review = Review.new(review_params)

		if @review.save
			render json: {message: "Review was successfully created."}
		else
			render json: @review.errors, status: :unprocessable_entity

		end
	end

	def new
		@review = Review.new
		if params[:id_order] == "-1" && params[:id_product] == "-1"
			@order = "-1"
			@product = "-1"
		else
			@order = Order.find(params[:id_order])
			@product = Product.find(params[:id_product])
		end
	end

	def update
		@user = User.find(params[:id_user])
		@review = @user.reviews.find(params[:id])

		if @review.update(review_params)
			render json: {message: "Review was successfully updated."}
		else
			render json: @review.errors, status: :unprocessable_entity
		end
	end


	def destroy
		@review = Review.find(params[:id])

		if @review.delete
			render json: {message: "Review was sucessfully deleted."}
		else
			render json: @review.errors, status: :unprocessable_entity
		end
	end

end
