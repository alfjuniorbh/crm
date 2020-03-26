require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

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

  describe "Not Authorized" do
    it 'verify status 302 to create new school' do
      school = create(:school)
      get :show, params: { id: school.id }
      expect(response).to  have_http_status(302)
    end
  end

  describe "Logged School User" do
    it 'create new school and school user' do
      devise_school = create(:devise_school)
      school = create(:school)

      sign_in devise_school

      get :show, params: { id: school.id }
      expect(response).to  have_http_status(200)
    end
  end

end
