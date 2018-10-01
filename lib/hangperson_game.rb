class HangpersonGame

  attr_accessor :word 
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def initialize(word)
 
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    
  end

  def guess(input)
    
    if  input == nil or input == "" or !input.match(/[A-Za-z]/)  # regular expressions for characters a through z 
      throw "Error"
    end
    
    if  @guesses.downcase.include? input.downcase or  @wrong_guesses.downcase.include? input.downcase
      return false
    end
    
    if @word.downcase.include? input.downcase # validates the case sensitive 
        @guesses += input
    else
        @wrong_guesses += input # wrong guesses plus input 
    end
  end
  

  
  def word_with_guesses(word=@word, guesses=@guesses)
    word.gsub(/[^ #{guesses}]/, '-') # Returns a copy of str with the all occurrences of pattern substituted for the second argument. 

  end
  
  def check_win_or_lose
    
    if @wrong_guesses.length == 7
      return :lose
    end
    
    if not word_with_guesses.include? "-" # include the guesses including - 
      return :win
    end 
    
    return :play
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end