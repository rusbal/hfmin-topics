class BooksController < ApplicationController
  def index
    @name = "Goodname"

    gon.push(books: Book.all)
  end
end
