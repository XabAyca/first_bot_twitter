require 'twitter'
require 'pry'
require 'rubocop'
require 'dotenv'
  Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

###### BOT pour follow les users avec un certain tweet #########
def fallow_by_hashtag(client)
  puts "Quel # souhaitez vous filtrer et follow le nombre d'utilisateurs ?"
  print "> #"
  str=gets.chomp
  puts "Combien ?"
  print "> "
  number=gets.chomp.to_i
  client.search("##{str}", result_type: "recent").take(number).collect {|tweet| client.follow(tweet.user)}
end