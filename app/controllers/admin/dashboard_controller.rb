class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["JUNGLE_USER"], password: ENV["JUNGLE_PASSWORD"]
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end