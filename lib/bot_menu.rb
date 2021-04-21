require 'pry'
require 'rubocop'
require 'dotenv'
load 'lib/bot_like_tweet.rb'
load 'lib/bot_follow_by_tweet.rb'
load 'lib/bot_follow_by_tweet_live.rb'
load 'lib/bot_5_random_tweet.rb'

puts "___________________________________________________________________"
puts "                 Bonjour, que voulez vous faire ?                 "
puts ""
puts "|> Envoyer un tweet à X journalistes :               \033[1;32m> Tapes 1 <"+"\033[0m"
puts "|> Liker des tweets avec des # clées :               \033[1;32m> Tapes 2 <"+"\033[0m"
puts "|> Follow les profils qui tweet :                    \033[1;32m> Tapes 3 <"+"\033[0m"
puts "|> Follow les profils qui tweet en live :            \033[1;32m> Tapes 4 <"+"\033[0m"
puts "|> Pour quitter                                      \033[1;41m> Tapes 0 <"+"\033[0m"
puts "___________________________________________________________________"
print ">>>> "
user_choose=gets.chomp.to_i
if user_choose==1
  bot_random_tweet(client,handles_array)
  elsif user_choose==2
    bot_like(client)
  elsif user_choose==3
    fallow_by_hashtag(client)
  elsif user_choose==4
    fallow_by_hashtag_live(client,client2)
end