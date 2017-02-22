class MainController < ApplicationController

#   def try
#     @guess = params[:guess].to_i
#     # check to see if secret number has been generated
#     if cookies[:secret].blank?
#       # store secret number as a cookie
#     cookies[:secret] = rand(1..100).to_i
#     end
#     # On each call, check the secret number against the guess (the parameter).
#     if cookies[:secret] == @guess
#       @result = "You Win!"
#       cookies[:secret] = nil
#       # YOU WIN!
#     elsif cookies[:secret] > @guess
#       @result = "Too Low"
#       # Too Low
#     else
#       @result = "Too High"
#       # Too high
#     end
#   end
#
# end

  def try
    @guess = params[:guess].to_i
    # if cookies is nil, use 0, otherwise use cookies and then to_i the result
    @guess_counter = (cookies[:counter] || 0).to_i
    # check to see if secret number has been generated
    if cookies[:secret].blank?
      # store secret number as a cookie
    cookies[:secret] = rand(1..100)
    end
    # On each call, check the secret number against the guess (the parameter).
    if cookies[:secret].to_i == @guess
      @result = "You Win!"
      @guess_counter += 1
      cookies[:secret] = nil
      # YOU WIN!
    elsif cookies[:secret].to_i > @guess
      @result = "Too Low"
      @guess_counter += 1
      # Too Low
    else
      @result = "Too High"
      @guess_counter += 1
      # Too high
    end
    cookies[:counter] = @guess_counter
    # render "try.html.erb"
  end

end
