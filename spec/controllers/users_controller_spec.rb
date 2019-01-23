require 'rails_helper'

describe UsersController, type: :controller do
  require 'database_cleaner'

  DatabaseCleaner.strategy = :truncation

  DatabaseCleaner.clean

  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }

  describe 'GET #show' do

      context 'when a user is logged in' do

        before do
          sign_in user1
        end

        it 'loads correct user details' do
          get :show, params: { id: user1.id}
          expect(response).to be_ok
          expect(assigns(:user)).to eq user1
        end
      end

      context 'when a user is not logged in' do
          it 'redirects to login' do
            get :show, params: { id: user1.id}
            expect(response).to redirect_to(new_user_session_path)
          end
      end

      context 'when user 1 tries to access user 2' do

        before do
          sign_in user2
        end

        it 'redirects to root path' do
          get :show, params: { id: user1.id}
        end
      end
  end

end
