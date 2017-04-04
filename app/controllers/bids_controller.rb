class BidsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action(:find_bid, { only: [:edit, :destroy, :update] })
  before_action(:find_auction, { only: [:create, :destroy] })
  before_action :authorize, only: [:edit, :destroy, :update]

  def create
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.auction = @auction
    @max = [@auction.reserve_price, Bid.where(auction_id: @auction.id).maximum(:bid) || 0].max
    if @bid.bid > @max
        @bid.save
          redirect_to auction_path(@auction), notice: 'Bid submitted'
        else
          @bids = Bid.where(auction_id: @auction.id)
          @user = @auction.user
          redirect_to auction_path(@auction), notice:"The Bid should be higher than #{@max}"
       end
  end

  def destroy
    bid = Bid.find params[:id]
    bid.destroy
    redirect_to auction_path(bid.auction_id), notice: 'Bid was deleted!'

  end

  def edit
  end

  def update
    if @bid.update bid_params
      redirect_to auction_path(@bid.auction), notice: 'Bid updated!'
    else
      render :edit
    end
  end

  private
    def bid_params
      params.require(:bid).permit([:bid])
    end

    def find_bid
      @bid = Bid.find params[:id]
    end

    def find_auction
      @auction = Auction.find(params[:auction_id])
    end

    def authorize
      if cannot?(:manage, @bid)
        redirect_to root_path, alert: 'Not authorized!'
      end
    end

end
