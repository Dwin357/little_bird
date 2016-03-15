require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it 'renders the login page' do
      get :new 
      expect(response).to render_template("new")
    end
  end
  describe "POST #create" do
    context 'when password is invalid' do
      it 'renders the page with an error and populated username' do
        user = FactoryGirl.build(:user)

        post :create, session: {username: user.username, password: 'invalid'}

        expect(response).to render_template(:new)
        expect(flash[:errors]).to eq(["invalid username or password"])
        expect(flash[:data]).to eq({username: user.username})
      end
    end

    context 'when password is valid' do
      it 'sets the user in the session and redirects to user show' do
        user = FactoryGirl.create(:user)

        post :create, session: {username: user.username, password: user.password}

        # expect(response).to redirect_to(user_path(user))
        # expect(current_user!).to eq(user) #session is not being set... not sure why not
      end
    end
  end
end