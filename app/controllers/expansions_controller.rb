class ExpansionsController < ApplicationController
  def index
    @expansions = Expansion.all
  end

  def show 
    @expansion = Expansion.find(params[:id])
    @cards = Card.where(expansion_id: @expansion.id)
  end

  def new
    @expansion = Expansion.new
  end

  def create
    @expansion = Expansion.new(expansion_params)
    if @expansion.save
      flash[:notice] = "Expansion Created"
      redirect_to root_path
    else
      flash[:notice] = @expansion.errors.full_messages.join("! ")
      render :new
    end
  end

  def edit
    @expansion = Expansion.find(params[:id])
  end

  def update
    @expansion = Expansion.find(params[:id])
    if @expansion.update(expansion_params)
      redirect_to @expansion
    else
      flash[:notice] = @expansion.errors.full_messages.join("! ")
      render :edit
    end
  end

  private
  def expansion_params
    params.require(:expansion).permit(:set_name, :set_size, :set_desc)
  end
end