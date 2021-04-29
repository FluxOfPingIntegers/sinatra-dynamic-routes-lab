require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    params[:name].reverse
  end

  get "/square/:number" do
    @squared = params[:number].to_i * params[:number].to_i
    @squared.to_s
  end

  get "/say/:number/:phrase" do
    @count = params[:number].to_i
    params[:phrase] * @count
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    words = []
    words << params[:word1]
    words << params[:word2]
    words << params[:word3]
    words << params[:word4]
    words << params[:word5]
    "#{words.join(' ')}."
  end

  get "/:operation/:number1/:number2" do
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    @operations = {
       :add => @number1 + @number2,
       :subtract => @number1 - @number2,
       :multiply => @number1 * @number2,
       :divide => @number1 / @number2
      }
    @operations.fetch_values(params[:operation].to_sym)[0].to_s
  end


end