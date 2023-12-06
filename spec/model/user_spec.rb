require 'rails_helper'
RSpec.describe User, type: :model do
      context 'when user is a buyer' do
        it 'returns true' do
          user = User.new(role: 'buyer')
          expect(user.buyer?).to be true
        end
  
      context 'when user is not a buyer' do
        it 'returns false' do
          user = User.new(role: 'seller')
          expect(user.buyer?).to be false
        end
      end
    end
  
      context 'when user is a seller' do
        it 'returns true' do
          user = User.new(role: 'seller')
          expect(user.seller?).to be true
        end

      context 'when user is not a seller' do
        it 'returns false' do
          user = User.new(role: 'buyer')
          expect(user.seller?).to be false
        end
      end
    end
  end
  