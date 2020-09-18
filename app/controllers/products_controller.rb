class ProductsController < ApplicationController
  before_action :set_shop
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :decorate_product, only: [:show, :edit, :update]

  def index
    @products = @shop.products
  end

  def show; end

  def new
    @product = CustomFieldDecorator.new(@shop.products.build)
  end

  def edit; end

  def create
    product = CustomFieldDecorator.new(@shop.products.new)
    product.assign_attributes(product_params)

    respond_to do |format|
      if product.save
        format.html { redirect_to shop_products_path(@shop), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: product }
      else
        format.html { render :new }
        format.json { render json: product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to shop_products_path(@shop), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to shop_products_url(@shop), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = @shop.products.find(params[:id])
  end

  def decorate_product
    @product = CustomFieldDecorator.new(@product)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, *custom_fields)
  end

  def custom_fields
    @shop.custom_fields.pluck(:internal_name)
  end
end
