class WelcomeController < ApplicationController
  def index
  end

  def home
  end

  def geocoding
    respond_to do |format|
      format.js
    end
  end

  def reverse_geocoding
    respond_to do |format|
      format.js
    end
  end
end
