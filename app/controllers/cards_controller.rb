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
      binding.pry
      flash[:notice] = "Ingredient Added."
      redirect_to expansion_path(@expansion)
    else
      flash.now[:notice] = @card.errors.full_messages.join("! ")
      render :new
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