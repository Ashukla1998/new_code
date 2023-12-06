# spec/controllers/welcome_controller_spec.rb

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    it 'assigns all products to @products' do
      # Create some test products using FactoryBot
      products = FactoryBot.create_list(:product, 3)

      get :index

      expect(assigns(:products)).to eq(products)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template :index
    end
  end
end
