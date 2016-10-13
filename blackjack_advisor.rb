
########## set up
require 'set'

first_card = ""
second_card = ""
total_card_value = ""
dealer_first_card = ""

type_of_user_hand = ""


############################ defining methods

def user_hand_first(first)
  first = gets.chomp.to_i
  return first
end


def user_hand_second(second)
  second = gets.chomp.to_i
  return second
end


def user_hand_dealer(dealer_card)
  dealer_card = gets.chomp.to_i
  return dealer_card
end


def total_user_value(first_value, second_value)
  first_value + second_value
end


def hand_type(check_first_card, check_second_card)
  hand_type = ""
  if check_first_card == check_second_card
    hand_type = "Pair"
  elsif check_first_card == 1 && check_second_card != 1 || check_first_card != 1 && check_second_card == 1
    hand_type = "Soft"
  else
    hand_type = "Hard"
  end
  hand_type
end






########################## code

# sets up user cards
first_card = user_hand_first(first_card)
second_card = user_hand_second(second_card)
total_card_value = total_user_value(first_card, second_card)

# dealer first card
dealer_first_card = user_hand_dealer(dealer_first_card)

type_of_user_hand = hand_type(first_card, second_card)



puts "Total user card value: #{total_card_value}"

puts "1st card: #{first_card}"
puts "2nd card: #{second_card}"
puts "Dealer card: #{dealer_first_card}"

puts ''

puts "User hand type: #{type_of_user_hand}"
