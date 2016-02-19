class GifController < ApplicationController
  
  before_filter :authorize

  def cool
  	redirect_to :back
  end

end