require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "GET index" do
    it "assigns @users" do

      group = Group.create(name:'qwer')
      get :index
      expect(assigns(:groups)).to eq([group])
      end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
