class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end

  def about
  end
    def authorize
    respond_to do |format|
      format.html 
    end
  end
end
