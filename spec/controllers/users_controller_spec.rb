require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it 'renders the new user page' do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    # context 'when invalid new user' do
    #   # no validations yet, no such thing as 'invalid params'
    #   it 'renders the page with errors'    
    # end

    context 'when valid user params' do
      it 'creates new user'do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it 'logs in new user' do
        # db only has 1 entry, so User.first also works
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(User.last).to eq(current_user!)
      end
      it 'redirects to user show page' do
        # db only has 1 entry, so User.first also works
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(user_path(User.last))
      end
    end
  end 
end