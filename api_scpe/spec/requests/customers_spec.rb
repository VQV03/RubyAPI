require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/customers", type: :request do
  before(:each) do
    auth_headers = { "ACCEPT" => "application/vnd.api+json", "CONTENT_TYPE" => "application/vnd.api+json"}
    post auths_url, headers: auth_headers
    token_request = JSON.parse(response.body)
    @token = token_request["token"]
  end

  # This should return the minimal set of attributes required to create a valid
  # Customer. As you add validations to Customer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
      cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
      address: Faker::Address.full_address
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      email: "",
      birthdate: "",
      cpf: "",
      address: ""
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CustomersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {
      "ACCEPT" => "application/vnd.api+json",
      "CONTENT_TYPE" => "application/vnd.api+json",
      "AUTHORIZATION" => "Bearer #{@token}"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Customer.create! valid_attributes
      get customers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customer = Customer.create! valid_attributes
      get customer_url(customer), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        expect {
          post customers_url,
               params: { customer: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Customer, :count).by(1)
      end

      it "renders a JSON response with the new customer" do
        post customers_url,
             params: { customer: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url,
               params: { customer: invalid_attributes }, as: :json
        }.to change(Customer, :count).by(0)
      end

      it "renders a JSON response with errors for the new customer" do
        post customers_url,
             params: { customer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          address: Faker::Address.full_address
        }
      }

      it "updates the requested customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, headers: valid_headers, as: :json
        customer.reload
      end

      it "renders a JSON response with the customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete customer_url(customer), headers: valid_headers, as: :json
      }.to change(Customer, :count).by(-1)
    end
  end
end
