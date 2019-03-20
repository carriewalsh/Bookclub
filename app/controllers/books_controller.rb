class BooksController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
  end
end
