# app/controllers/game_controller.rb
class GameController < ApplicationController
  def index
    reset_game if session[:secret_number].nil?
  end

  def guess
    session[:attempts] += 1
    @guess = params[:guess].to_i
    @secret_number = session[:secret_number]

    if @guess == @secret_number
      @message = "Congratulations! You guessed the number in #{session[:attempts]} attempts."
      @game_over = true
    elsif @guess < @secret_number
      @message = 'Too low!'
    else
      @message = 'Too high!'
    end

    render :index
  end

  def reset
    reset_game
    redirect_to root_path
  end

  private

  def reset_game
    session[:secret_number] = rand(1..100)
    session[:attempts] = 0
  end
end
