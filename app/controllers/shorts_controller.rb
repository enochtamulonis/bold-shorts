class ShortsController < ApplicationController
  def new
    @short = Short.new
  end

  def create
    @short = Short.create(short_params)
    if @short.save
      redirect_to @short
    else
      render :new
    end
  end

  def show
    @short = Short.find(params[:id])
  end

  private

  def short_params
    params.require(:short).permit(:text, :duration)
  end
end