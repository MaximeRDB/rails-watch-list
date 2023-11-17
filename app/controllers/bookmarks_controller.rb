class BookmarksController < ApplicationController
  def edit
  end

  def show
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to root_path, notice: "Bravo tu as crée un nouveau bookmark"
    else
      render :new, notice: "Try again"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to root_path, notice: "Bravo tu as détruit le Bookmark."
  end

  def index
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
