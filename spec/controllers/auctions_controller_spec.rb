require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  def user
    @user ||=User.create({first_name: 'Fernando', last_name: 'Huber', password: 'p0o9i8u7', email:'fernando.huber@gmail.com'})
  end

  def auctions
    Auction.create({title: 'test1', details:'test1', reserve_price: '10'})
  end

  describe '#index' do
    before do
      auctions
      get :index
  end
end

  describe '#new' do

    context 'with no signed in user' do
      it 'redirects to the sign in page' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context 'with signed in user' do
      before do
        request.session[:user_id] = user.id;
        get :new
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'assigns a auction instance variable to a new Auction' do
        expect(assigns(:auction)).to be_a_new Auction
      end
    end

    describe '#create' do

    context 'without a signed in user' do
      it 'redirects to the sign in page' do
        post :create
        expect(response).to redirect_to(new_session_path)
        end
      end
    end

    context 'with a signed in user' do
      before { request.session[:user_id] = user.id }

      context 'with valid attributes' do
        it 'creates a new auction in the database' do
          count_before = Auction.count
          post :create, params: { auction: {title: 'test1',description:'test1' , reserve_price:'10'} }
          count_after  = Auction.count
          expect(count_after).to eq(count_before + 1)
        end
      end
    end


end
