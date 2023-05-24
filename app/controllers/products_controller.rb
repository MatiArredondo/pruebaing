class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def index_moderator
		@products = Product.all
  end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_url
		else
			flash.now[:error] = @product.errors.full_messages.join(", ")
    		render :new, status: :unprocessable_entity
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to product_url(@product), notice: "Product was successfully updated."
		else
			flash.now[:error] = @product.errors.full_messages.join(", ")
    		render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.delete
		redirect_to products_url, notice: "Product was successfully destroyed."
	end

	def product_params
		params.require(:product).permit(:name, :price, :image, :id_user)
	end
end
