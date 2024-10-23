class WelcomeController < ApplicationController
  def index
    @homeland = 'United States'
    @countries = ['Chile', 'Bolivia', 'Peru', 'Ecuador', 'Argentina']
  end
end
