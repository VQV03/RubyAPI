class ProductsController < ApplicationController

  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  include ErrorSerializer

  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)


    @products = Product.all.page(page_number).per(per_page)

    # paginate json: @products
    render json: @products #, show_category: (param? params[:category]), show_unit: (param? params[:unit])
  end

  def all
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: ErrorSerializer.serialize(@product.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: ErrorSerializer.serialize(@product.errors), status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :quantity_in_stock, :price, :highlight, :category_id, :unit_id, :image)
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        hmac_secret = ENV['TOKEN']
        JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
      end
    end
end
