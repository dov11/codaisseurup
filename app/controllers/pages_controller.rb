class PagesController < ApplicationController
  def home
    @categories = Category.all
  end
  def about
  end
  def tc
  end
end
