# require 'rails_helper'

# RSpec.describe CartProductsController, type: :controller do
#   let(:user) { FactoryBot.create(:user) }
#   let(:product) { FactoryBot.create(:product) }

#   sign_in_user

#   describe 'GET #index' do
#     it 'renders the index template' do
#       get :index
#       expect(response).to render_template :index
#     end

#     it 'assigns cart products for the current user' do
#       cart_product = FactoryBot.create(:cart_product, cart: user.cart)
#       get :index
#       expect(assigns(:cart_products)).to eq([cart_product])
#     end

#     it 'redirects to products_path if user does not have a cart' do
#       user.cart.destroy # Assuming you have a dependent destroy set on the user-cart association
#       get :index
#       expect(response).to redirect_to products_path
#     end
#   end

#   describe 'POST #new' do
#     it 'creates a new cart product and redirects to products_path' do
#       expect do
#         post :new, params: { product_id: product.id }
#       end.to change(CartProduct, :count).by(1)

#       expect(response).to redirect_to products_path
#       expect(flash[:notice]).to eq('Product added to cart!')
#     end

#     it 'increments quantity if cart product already exists' do
#       cart_product = FactoryBot.create(:cart_product, cart: user.cart, product: product)
#       expect do
#         post :new, params: { product_id: product.id }
#       end.not_to change(CartProduct, :count)

#       expect(response).to redirect_to products_path
#       expect(cart_product.reload.quantity).to eq(2)
#       expect(flash[:notice]).to eq('Product added to cart!')
#     end

#     it 'redirects to root_path with alert if failed to add product to cart' do
#       allow_any_instance_of(CartProduct).to receive(:save).and_return(false)
#       post :new, params: { product_id: product.id }

#       expect(response).to redirect_to root_path
#       expect(flash[:alert]).to eq('Failed to add product to cart!')
#     end
#   end

#   describe 'DELETE #destroy' do
#     let(:cart_product) { FactoryBot.create(:cart_product, cart: user.cart) }

#     it 'destroys the cart product and redirects to cart_products_path' do
#       delete :destroy, params: { id: cart_product.id }

#       expect(response).to redirect_to cart_products_path
#       expect(flash[:notice]).to eq('Product was successfully removed from cart.')
#       expect(CartProduct.exists?(cart_product.id)).to be_falsey
#     end

#     it 'redirects to cart_products_path with alert if product not found in cart' do
#       delete :destroy, params: { id: 'nonexistent_id' }

#       expect(response).to redirect_to cart_products_path
#       expect(flash[:alert]).to eq('Product not found in cart.')
#     end
#   end
# end
