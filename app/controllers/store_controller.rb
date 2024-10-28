class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # Assuming your Product model has a `title` attribute
  end
end

