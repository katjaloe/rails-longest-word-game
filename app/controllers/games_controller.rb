class GamesController < ApplicationController
  require "json"
  require "open-uri"

  def new
    @letters = Array('A'..'Z').sample(10)
    # ["A".."Z"].to_a.sample
  end

  def score
    @rand_letters = params[:letters]
    @score = params[:user_word]

    word_arr = @score.upcase.chars
    @result = word_arr.all? do |letter|
      @rand_letters.include?(letter)
    end

    url = "https://wagon-dictionary.herokuapp.com/#{@score}"
    words = URI.open(url).read
    @word = JSON.parse(words)

    @valid_word =
     if @result == false
     puts  "Sorry, but #{@score.upcase} can't be built of #{@rand_letters}"
     elsif @result == true && @word[:found] == true
      puts "Congratulations! #{@score.upcase} is a valid English word!"
      else
      puts "Sorry, but #{@score.upcase} is not a valid English word."
      end







    # raise

  end

end
