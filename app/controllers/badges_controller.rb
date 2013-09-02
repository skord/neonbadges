class BadgesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_badge, only: [:show]
  before_action :set_owned_badge, only: [:edit, :update, :destroy]
  def index
    @badges = Badge.page(params[:page])
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def new
    @owned_badge = current_user.owned_badges.new
  end

  def create
    @owned_badge = current_user.owned_badges.new(badge_params)
    if @owned_badge.save
      redirect_to badge_url(@owned_badge)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @owned_badge.update_attributes(badge_params)
      redirect_to badge_url(@owned_badge)
    else
      render :edit
    end
  end

  def destroy
    @owned_badge.destroy
    redirect_to badges_url, notice: 'Badge Destroyed!'
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_owned_badge
    @owned_badge = current_user.badges.find(params[:id])
  end

  def badge_params
    params[:badge].permit(:name, :description, :image, :free_to_award)
  end
end
