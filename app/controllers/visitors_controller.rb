class VisitorsController < ApplicationController
  def index
    @products = params[:sort].present? && params[:sort] == 'alphabetical' ? Product.alphabetical : Product.all
  end
end
