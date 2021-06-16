class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
  end

  def show
  end

  def index
  end

  def edit
  end

end
