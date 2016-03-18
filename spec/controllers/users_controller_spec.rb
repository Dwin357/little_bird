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
    #   # no validations yet
    #   it 'renders the page with errors'    
    # end

    context 'when valid user params' do
      # it 'adds user to db' do
      #   subject = User.
      # end
      # it 'sets the user in sessions'
      # it 'redirects to user show page'
    end
  end 
end
