class WordsController < ApplicationController
  def select
    words = {}
    # word = 'hello'
    match = false
    given_word= params[:word]
    match = bin_fsearch(given_word, "#{Rails.root}/vendor/Words/Words/en.txt")
    # File.foreach("#{Rails.root}/vendor/Words/Words/en.txt") do |file|
    #   file.each do |line|
    #     match = line.strip == given_word  
    #   end
    # end
    # puts words
    # if stale?

    # result = IO.foreach("#{Rails.root}/vendor/Words/Words/en.txt").lazy.find(given_word)  
    # byebug
    render json: { word: given_word, match: match }
    # end
  end


  private

  def bin_fsearch(search_word, file)
    f = File.open file
  
    search = {min: 0, max: f.size}
    recent_gap = 0
    prev_gap = 1
    # gap = sear  ch[:max]
    while(recent_gap<prev_gap)
      puts "#{search[:max]} - #{search[:min]} = #{search[:max] - search[:min]}"
      prev_gap = search[:max] - search[:min]
      # gap = search[:max] - search[:min]
      # prev_word = line_word || search_word 
      # go to file midpoint
      f.seek (search[:max] + search[:min]) / 2
  
      # read in until EOL
      f.gets
  
      # record the actual mid-point we are using
      pos = f.pos
  
      # read in next line
      line = f.gets
  
      # get word from line
      # prev_word = line_word
      line_word = line.strip

      puts "#{line_word}  ----------- #{search_word}" 
      if line_word < search_word
        puts "set min $#{f.pos}"
        search[:min] = pos + 1
      elsif line_word > search_word
        puts "set max $#{pos}"
        search[:max] = pos - 1
      else
        f.seek pos
        return true
      end
      recent_gap = search[:max] - search[:min]
    end
    return false;
  end
  # def word_params
  #   #
  #   params.permit(:word)
  # end
end

# 2714ms