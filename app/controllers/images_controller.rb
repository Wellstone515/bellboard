class ImagesController < ApplicationController

  def index
    @images = Image.order("id desc")
  end

end
