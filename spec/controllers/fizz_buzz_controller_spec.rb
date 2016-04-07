require 'rails_helper'

RSpec.describe FizzBuzzController, type: :controller do

  before { get :index }

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assings view values" do
      expect(assigns(:facade)).to be_an Hash
    end

    describe "fizz_buzz_index_facade" do

      subject(:facade_obj) { controller.fizz_buzz_index_facade }

      it { is_expected.to respond_to(:page) }

      it "returns int when call page" do
        expect(facade_obj.pages).to be_an Integer
      end

    end

  end

end
