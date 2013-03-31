class DecksController < ApplicationController

  before_filter :authenticate
  # For before_filter, the symbol is the method you are calling.

  def index
    @decks = current_user.decks
  end

  def show
    @deck = find_deck
    @cards = @deck.cards
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = find_deck
    @deck.save
    redirect_to decks_path
    # redirect_to "/decks"
  end

  def edit
    @deck = find_deck
  end

  def update
    @deck = find_deck
    @deck.update_attributes(params[:deck])
    # redirect_to "/decks/#{@deck.id}"
    redirect_to @deck

  end

  def destroy
    @deck = find_deck
    @deck.destroy
    # redirect_to "/decks"
    redirect_to decks_path
  end

  private
  def find_deck
    current_user.decks.find(params[:deck_id])
  end

end
