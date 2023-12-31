class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_to list_path(@list), notice: "Bravo tu as crée une nouvelle liste"
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy!
    redirect_to root_path, notice: "Bravo tu as détruit t'as liste."
  end

  def index
    @lists = List.all
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
