class HomeController < ApplicationController
  def index
  end

  def create
    @i = Image.create(params.permit(:image, :title))

    render 'show'
  end

  def show
    @i = Image.find params[:id]
  end
end
