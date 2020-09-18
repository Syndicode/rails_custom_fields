class CustomFieldsController < ApplicationController
  before_action :set_shop
  before_action :set_custom_field, only: [:show, :edit, :update, :destroy]

  def index
    @custom_fields = @shop.custom_fields
  end

  def show
  end

  def new
    @custom_field = @shop.custom_fields.build
  end

  def edit
  end

  def create
    @custom_field = @shop.custom_fields.new(custom_field_params)

    respond_to do |format|
      if @custom_field.save
        format.html { redirect_to shop_custom_fields_path(@shop), notice: 'Custom field was successfully created.' }
        format.json { render :show, status: :created, location: @custom_field }
      else
        format.html { render :new }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @custom_field.update(custom_field_params)
        format.html { redirect_to shop_custom_fields_path(@shop), notice: 'Custom field was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_field }
      else
        format.html { render :edit }
        format.json { render json: @custom_field.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.html { redirect_to shop_custom_fields_url(@shop), notice: 'Custom field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_custom_field
    @custom_field = @shop.custom_fields.find(params[:id])
  end

  def custom_field_params
    params.require(:custom_field).permit(:label, :internal_name, :field_type, :description)
  end
end
