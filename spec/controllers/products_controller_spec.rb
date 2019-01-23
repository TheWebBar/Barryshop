require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

#####Test Index#####
  describe 'GET #index' do

    context 'when a user clicks products' do

      it 'shows products overview' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

#####Test Show#####
  describe 'GET #show' do

    context 'when a user clicks show' do

      it 'shows product details' do
        get :show, params: {id: @product}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end
  end

#####Test New#####
  describe 'GET #new' do

    context 'when a user is not logged in' do

      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a non-admin is logged in' do
      before do
        sign_in @user
      end

      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when an admin is logged in' do
      before do
        sign_in @admin
      end

      it 'renders template new' do
        get :new
        expect(response).to render_template('new')
      end
    end
  end

#####Test Edit#####
  describe 'GET #edit' do

    context 'when a user is not logged in' do

      it 'redirects to root path' do
        get :edit, params: {id: @product}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a non-admin is logged in' do
      before do
        sign_in @user
      end

      it 'redirects to root path' do
        get :edit, params: {id: @product}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when an admin is logged in' do
      before do
        sign_in @admin
      end

      it 'renders template edit' do
        get :edit, params: {id: @product}
        expect(response).to render_template('edit')
      end
    end
  end

#####Test Destroy#####
  describe 'DELETE #destroy' do

    context 'when a user is not logged in' do

      it 'redirects to root path' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a non-admin is logged in' do
      before do
        sign_in @user
      end

      it 'redirects to root path' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when an admin is logged in' do
      before do
        sign_in @admin
      end

      it 'renders template edit' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to(products_path)
      end
    end
  end

#####Test Create#####
  describe 'POST #create' do
    before do
      sign_in @admin
    end

    context 'when a user saves a valid product' do

      it 'redirects to product path' do
        post :create, params: {product: @product.attributes}
        expect(response).to redirect_to("http://test.host/products/2")
      end
    end

  end

  #####Test Update#####
    describe 'PATCH #update' do
      before do
        sign_in @admin
      end

      context 'when a user saves an updated valid product' do

        let(:product1) { Product.create!(name: "Knife", description:"s", image_url:"mm", colour:"black", price:"23")}

        it 'Shows notice, that product was successfully updated' do
          patch :update, params: {id: @product, product: product1.attributes}
          expect(flash[:notice]).to eq 'Product was successfully updated.'
        end
      end

    end
end
