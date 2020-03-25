require 'rails_helper'

RSpec.describe SchoolBranchesController, type: :controller do

  describe "GET #index" do
    it "return view index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "return status success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
