class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    if params[:search].present? && params[:category_id].present?
      @items = Item.where("(title LIKE ? OR description LIKE ?) AND category_id = ? ", "%#{params[:search]}%", "%#{params[:search]}%", params[:category_id]).page params[:page]
    elsif params[:search].present? && params[:category_id].blank?
      @items = Item.where("title LIKE ? OR description LIKE ? ", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
    else
      @items = Item.all.page params[:page]
    end
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @item.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @item.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, notice: "Item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.expect(item: [ :title, :description, :item_image_path, :artist, :price, :quantity ])
      params.require(:item).permit(:image)
    end
end
