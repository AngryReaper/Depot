class AdminController < ApplicationController
  def index
  		@total_count = Order.count
  end
end
