require 'json'
require'open-uri'


class GamesController < ApplicationController
  # @letters
  def new
    @letters = []
    10.times do
      @letters.push(('a'..'z').to_a.sample)
    end
  end

  def score
    @exists = true
    @letters = params[:letters].split("")
    guess_letters = params[:word].split("")
    guess_letters.each do |guess_letter|
      if @letters.index(guess_letter)
        @letters.delete(guess_letter)
      else
        @exists = false
        # break
      end
    end
    if @exists && params[:word].length > 0
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
      serialized = open(url).read
      @response = JSON.parse(serialized)
      # raise
    end
  end
end
