
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'protected methods' do

    controller do
      def after_sign_in_path_for(resource)
          super resource
      end

      def after_sign_up_path_for(resource)
        super resource
      end

      def after_sign_out_path_for(resource)
        super resource
      end

    end

   
    describe 'AfterSignInPathFor' do
      let(:user) { FactoryBot.create(:user) }
  
      it 'redirects to products_path' do
        sign_in user
        controller.after_sign_in_path_for(user).should == products_path
      end
    end

    describe '#after_sign_up_path_for' do
    let(:user) { FactoryBot.create(:user) }
      it 'redirects to new_user_session_path' do
        sign_in user
        expect(controller.after_sign_up_path_for(user)).to eq(new_user_session_path)
      end
    end

    describe '#after_sign_out_path_for' do
    let(:user) { FactoryBot.create(:user) }
      it 'redirects to root_path' do
        sign_in user
        expect(controller.after_sign_out_path_for(user)).to eq(root_path)
      end
    end
  end

  describe 'rescue_from CanCan::AccessDenied' do
    controller do
      def index
        raise CanCan::AccessDenied
      end
    end

    it 'redirects to root_path with an alert message' do
      get :index
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to be_present
    end
  end

  describe 'configure_permitted_parameters' do
    it 'permits role parameter for sign-up' do
      expect(controller).to receive(:devise_parameter_sanitizer).and_return(double(permit: true))
      controller.send(:configure_permitted_parameters)
    end
  end
end
