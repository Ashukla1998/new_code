# spec/models/ability_spec.rb
require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }

    let(:user) { nil } # Guest user by default

    context "when user is a buyer" do
      let(:user) { FactoryBot.create(:user, role: 'buyer') }
      let(:product) { FactoryBot.create(:product) }

      it "can read products" do
        expect(ability.can?(:read, Product.new)).to be_truthy
      end

      it "can buy products" do
        expect(ability.can?(:buy, Product.new)).to be_truthy
      end

      it "cannot manage products" do
        expect(ability.can?(:manage, Product.new)).to be_falsy
      end
    end

    # ... (similar adjustments for other contexts)

    context "when user is a guest" do
      it "cannot read products" do
        expect(ability.can?(:read, Product.new)).to be_falsy
      end

      it "cannot buy products" do
        expect(ability.can?(:buy, Product.new)).to be_falsy
      end

      it "cannot manage products" do
        expect(ability.can?(:manage, Product.new)).to be_falsy
      end
    end
  end
end
