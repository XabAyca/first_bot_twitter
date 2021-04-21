require 'twitter'
require 'pry'
require 'rubocop'
require 'dotenv'
  Dotenv.load

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

client2 = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

####### BOT pour follow les comptes publiant un certain "#"  ##########
def fallow_by_hashtag_live(client,client2)
  puts "Quel # souhaitez vous filtrer et follow son utilisateur en live ?"
  print "> #"
  str=gets.chomp
  client.filter(track: "##{str}") {|tweet| client2.follow(tweet.user)}
end