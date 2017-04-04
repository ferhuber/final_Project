require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  def user
    @user ||=User.create({first_name: 'Fernando', last_name: 'Huber', password: 'p0o9i8u7', email:'fernando.huber@gmail.com'})
  end

  def auctions
    Auction.create({title: 'test1', details:'test1', reserve_price: '10'})
  end

  def bids
    Bid.create({bid: '10'})
  end



    context 'with a signed in user' do
      before { request.session[:user_id] = user.id }

      context 'with valid attributes' do
        it 'creates a new bid in the database' do
          auction = auctions
          count_before = Bid.count
          post :create,   params: {auction_id: auction.id, bid:{bid:'11'}}
          count_after  = Bid.count
          expect(count_after).to eq(count_before + 1)
        end

        it 'redirects to the bid show page' do
          auction = auctions
         post :create, params: {auction_id: auction.id, bid:{bid:'15'}}
         expect(response).to redirect_to(auction_path(auction))
       end

      end
    end

end
