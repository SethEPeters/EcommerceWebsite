class AboutsController < ApplicationController
  def index
    @abouts = About.all
  end

  def show
    @about = About.find(params[:id])
  end
end
