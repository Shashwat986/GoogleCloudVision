class HomeController < ApplicationController
  def index
  end

  def create
    params.require([:image, :title])
    permitted = params.permit(:title, :image)
    @i = Image.create! permitted

    @i.process_tags

    redirect_to action: :show, id: @i.id
  end

  def show
    @i = Image.find params[:id]
  end
end
