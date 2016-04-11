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
      it 'sets the user in the session' do
        user = FactoryGirl.create(:user)

        # need to use "attributes_for(:user)[:password]"
        # b/c user.password does not provide the original
        # user-password due to bcrypt encryption
        
        post :create, session: {username: user.username, password: attributes_for(:user)[:password]}

        expect(current_user!).to eq(user)
      end
      it 'redirects the user to their show page' do
        user = FactoryGirl.create(:user)

        post :create, session: {username: user.username, password: attributes_for(:user)[:password]}

        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      user = FactoryGirl.create(:user)
      login(user)
    end

    it "clears the session" do
      delete :destroy, id:1 # the controller doesn't need the id, this is just to trick RSpec into the right route
      expect(current_user).to be nil
    end
    it "redirects to the new session path" do
      delete :destroy, id: 1 # the controller doesn't need the id, this is just to trick RSpec into the right route

      expect(response).to redirect_to(new_session_path)
    end
  end
end