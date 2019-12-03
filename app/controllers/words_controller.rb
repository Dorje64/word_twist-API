class WordsController < ApplicationController
  def select
    words = {}
    File.open("#{Rails.root}/vendor/Words/Words/en.txt") do |file|
      file.each do |line|
        words[line.strip] = true
      end
    end
    # puts words
    render json: words.first
  end
end
