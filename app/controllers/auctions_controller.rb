class AuctionsController < ApplicationController

    before_action :authenticate_user!, except: [:show, :index]
    before_action(:find_auction, { except: [:create, :new, :index] })
    before_action :authorize, only: [:edit, :destroy, :update]

    def new
      @auction  = Auction.new

    end

    def create
      auction_params = params.require(:auction).permit([:id,
                                                        :title,
                                                        :details,
                                                        :reserve_price,
                                                        :end_date,
                                                        aasm_state:[:cancel]])

      @auction = Auction.new(auction_params)
      @auction.user_id = current_user.id
      if @auction.save
        redirect_to auctions_path(@auction)
      else
        render :new
      end
    end

    def index
      @auctions = Auction.order(created_at: :desc)
    end

    def show
      # render json:[params]
      @auction = Auction.find params[:id]
      @bid = Bid.new
      @bids = Bid.where(auction_id: @auction.id)
      @user = User.all
    end

    def destroy
      auction = Auction.find params[:id]
      auction.destroy
      redirect_to auctions_path
    end

    def edit
    end

    def update
      @auction = Auction.find params[:id]

      auction_params = params.require(:auction).permit([:id,
                                                        :title,
                                                        :details,
                                                        :reserve_price,
                                                        :end_date,
                                                        :aasm_state])

      if @auction.update auction_params
        redirect_to auction_path(@auction), notice: 'Auction updated!'
      else
        render :edit
      end
    end

    def destroy
      auction = Auction.find params[:id]
      auction.destroy
      redirect_to auctions_path
    end

    def published
      auction = Auction.find(params[:id])
      auction.published!
    end

    def canceled
      auction = Auction.find(params[:id])
      auction.canceled!
    end

    private

    def find_auction
      @auction = Auction.find(params[:id])
    end

    def find_bid
      @bid = Bid.find params[:id]
    end

    def authorize
      if cannot?(:manage, @auction)
         redirect_to root_path, alert: 'Not authorized!'
      end
    end

end
