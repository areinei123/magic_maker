class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
  end  

  def new
    @expansion = Expansion.find(params[:expansion_id])
    @card = Card.new
  end

  def create
    @expansion = Expansion.find(params[:expansion_id])
    @card = @expansion.cards.new(card_params)
    if @card.save
      flash[:notice] = "Ingredient Added."
      redirect_to expansion_path(@expansion)
    else
      flash.now[:notice] = @card.errors.full_messages.join("! ")
      render :new
    end
  end

  def edit
    @expansion = Expansion.find(params[:expansion_id])
    @card = Card.find(params[:id])
  end

  def update
    @expansion = Expansion.find(params[:expansion_id])
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to expansion_card_path(@expansion, @card)
    else
      flash[:notice] = @card.errors.full_messages.join("! ")
      render :edit
    end
  end

  private

  def card_params
    params.require(:card).permit(
      :name, :mana_cost, :main_type, :sub_type, :rules_text, :flavor_text,
      :power, :toughness, :image, :extra_rules
    )
  end
end