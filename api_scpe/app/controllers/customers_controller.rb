class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /customers
  def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)


    @customers = Customer.all.page(page_number).per(per_page)

    render json: @customers
  end

  def all
    @customers = Customer.all

    render json: @customers
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :email, :birthdate, :cpf, :address, :phone1, :phone2)
    end
end
