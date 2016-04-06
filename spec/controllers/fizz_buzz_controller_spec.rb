require 'rails_helper'

RSpec.describe FizzBuzzController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assings @values" do
      get :index

      expect(assigns(:values)).to be_an_instance_of Array
    end
  end

end
