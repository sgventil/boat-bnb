class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :home]
  def home
  end
end
