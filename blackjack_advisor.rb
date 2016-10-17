
########## set up
require 'set'

first_card = ""
second_card = ""
total_card_value = ""
dealer_first_card = ""

type_of_user_hand = ""


############################ defining methods

def get_card(choice)
  puts "Please enter your first card: "
  choice = gets.chomp
  case choice
  when "J","Q","K","j","q","k"
    return 10
  when "A","a"
    return 11
  else
    return choice.to_i
  end
end



def total_user_value(first_value, second_value)
  first_value + second_value
end


def hand_type(check_first_card, check_second_card)
  hand_type = ""
  if check_first_card == check_second_card
    hand_type = "Pair"
  elsif check_first_card == 11 && check_second_card != 11 || check_first_card != 11 && check_second_card == 11
    hand_type = "Soft"
  else
    hand_type = "Hard"
  end
  hand_type
end


def choose_tables(type_chose, hard_pair, soft_pair, pair_pair)
  case type_chose
  when  "Hard"
    return hard_pair
  when  "Soft"
    return soft_pair
  when  "Pair"
    return pair_pair
  else
    puts "ERROR, table type not selected"
  end
end

def subtract_amount (type)
  if type == "Pair"
    2
  elsif type =="Hard"
    5
  else
    13
  end
end

def subtract_from_choice (type,one_card,two_card)
  if type == "Pair"
    one_card
  else
    two_card
  end
end

# ___What I need to DO___


########################## code

# sets up user cards
first_card = get_card(first_card)
second_card = get_card(second_card)
total_card_value = total_user_value(first_card, second_card)

# dealer first card
dealer_first_card = get_card(dealer_first_card)

type_of_user_hand = hand_type(first_card, second_card)


puts '_'*50
puts "Total user card value: #{total_card_value}"

puts "1st card: #{first_card}"
puts "2nd card: #{second_card}"
puts "Dealer card: #{dealer_first_card}"

puts '_'*50

puts "User hand type: #{type_of_user_hand}"

###

puts '_'*50

###


hard_type_solutions = {
  5 => ["Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],
  6 => ["Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],
  7 => ["Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],
  8 => ["Hit", "Hit", "Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],
  9 => ["Double if possible, otherwise Hit" "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],
  10 => ["Double if possible, otherwise Hit" "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit"],
  11 => ["Double if possible, otherwise Hit" "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit"],
  12 => ["Hit" "Hit", "Stand", "Stand", "Stand", "Hit", "Hit", "Hit", "Hit", "Hit"],
  13 => ["Stand" "Stand", "Stand", "Stand", "Stand", "Hit", "Hit", "Hit", "Hit", "Hit"],
  14 => ["Stand" "Stand", "Stand", "Stand", "Stand", "Hit", "Hit", "Hit", "Hit", "Hit"],
  15 => ["Stand" "Stand", "Stand", "Stand", "Stand", "Hit", "Hit", "Hit", "Hit", "Hit"],
  16 => ["Stand" "Stand", "Stand", "Stand", "Stand", "Hit", "Hit", "Hit", "Hit", "Hit"],
  17 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],
  18 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],
  19 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],
  20 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],
  21 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"]
}

soft_type_solutions = {
  13 => ["Hit", "Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],    # 0
  14 => ["Hit", "Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],    # 1
  15 => ["Hit", "Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],    # 2
  16 => ["Hit", "Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],    # 3
  17 => ["Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit", "Hit", "Hit", "Hit"],  # 4
  18 => ["Stand", "Double if possible, otherwise Stand", "Double if possible, otherwise Stand", "Double if possible, otherwise Stand", "Double if possible, otherwise Stand", "Stand", "Stand", "Hit", "Hit", "Stand"],   # 5
  19 => ["Stand", "Stand", "Stand", "Stand", "Double if possible, otherwise Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],      # 6
  20 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],       # 7
  21 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"]        # 8
}

pair_type_solutions = {
      #2        #3      #4        #5      #6        #7      #8      #9    #10     #11
      # 0        1      2         3       4         5         6       7     8       9
4 => ["Split", "Split", "Split", "Split", "Split", "Split", "Hit", "Hit", "Hit", "Hit"],          # 0
6 => ["Split", "Split", "Split", "Split", "Split", "Split", "Split", "Hit", "Hit", "Hit"],          # 1
8 => ["Hit", "Hit", "Split", "Split", "Split", "Hit", "Hit", "Hit", "Hit", "Hit"],          # 2
10 => ["Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Double if possible, otherwise Hit", "Hit", "Hit"], # 3
12 => ["Split", "Split", "Split", "Split", "Split", "Split", "Hit", "Hit", "Hit", "Hit"],         # 4
14 => ["Split", "Split", "Split", "Split", "Split", "Split", "Split", "Hit", "Stand", "Hit"],         # 5
16 => ["Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split"],         # 6
18 => ["Split", "Split", "Split", "Split", "Split", "Stand", "Split", "Split", "Stand", "Stand"],         # 7
20 => ["Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand", "Stand"],         # 8
22 => ["Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split", "Split"]           # 9
}

######################



chosen_table = choose_tables(type_of_user_hand, hard_type_solutions, soft_type_solutions, pair_type_solutions)

amount = subtract_amount(type_of_user_hand)

keys = chosen_table.keys




# I know there is a way to do this in a method but I did this quickly to get the right answer.
if type_of_user_hand == "Pair"
  to_find_index = chosen_table[keys[first_card-amount]]

else
  to_find_index = chosen_table[keys[total_card_value-amount]]

end



puts "You should: #{to_find_index[dealer_first_card-2]}"
puts '_'*50
