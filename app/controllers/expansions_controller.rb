class ExpansionsController < ApplicationController
  def index
    @expansions = Expansion.all
  end

  def show 
    @expansion = Expansion.find(params[:id])
  end
end