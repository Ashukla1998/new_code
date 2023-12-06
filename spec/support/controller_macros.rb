module ControllerMacros
    def sign_in_user
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @signed_in_user = FactoryBot.build(:user) # Use build to create a user without saving to the database first
        @signed_in_user.save! # Save the user to the database
        sign_in @signed_in_user
      end
    end
  end