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
    before do
      @devise_school = create(:devise_school)
      @school = create(:school)
    end


    it 'validate content-type' do
      school_params = attributes_for(:school)
      sign_in @devise_school
      post :create, format: :json, params: { school: school_params } 
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'validate flash notice' do
      school_params = attributes_for(:school)
      sign_in @devise_school
      post :create, params: { school: school_params } 
      expect(flash[:notice]).to match(/registered successufull!/)
    end

    it 'create new school and school user with attributes' do
      school_params = attributes_for(:school)
      sign_in @devise_school
      expect { 
        post :create, params: { school: school_params } 
      }.to change(School, :count).by(1)
    end

    it 'create new school and school user' do
      sign_in @devise_school
      get :show, params: { id: @school.id }
      expect(response).to  have_http_status(200)
    end
  end

end
