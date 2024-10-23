# app/controllers/store_controller.rb
class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end
end

