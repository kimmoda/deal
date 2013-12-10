class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def follow
    customer = current_user
    @business = Business.find params[:id]
    customer.follow(@business)

    redirect_to businesses_path
  end

  def dashboard
  	@business = Business.find params[:id]
  	@offers = @business.offers
  	@impressions = []
  	@offers.each do |offer|
  	  @impressions << offer.impressions
  	end
  end



end