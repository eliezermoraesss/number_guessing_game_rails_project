class GameController < ApplicationController
  def index
    session[:secret_number] = rand(1..100) if session[:secret_number].nil?
    session[:attempts] = 0
  end

  def guess
    session[:attempts] += 1
    @guess = params[:guess].to_i
    @secret_number = session[:secret_number]

    if @guess == @secret_number
      @message = "Congratulations! You guessed the number in #{session[:attempts]} attempts."
      session[:secret_number] = nil # Reset the game
    elsif @guess < @secret_number
      @message = 'Too low!'
    else
      @message = 'Too high!'
    end

    render :index
  end
end
