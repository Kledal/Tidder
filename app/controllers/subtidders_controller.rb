class SubtiddersController < ApplicationController
  before_action :find_subtidder, only: :show

  def show

  end

  private

  def find_subtidder
    @subtidder = Subtidder.find(params[:id])
  end
end
