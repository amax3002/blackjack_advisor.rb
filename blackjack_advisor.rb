
########## set up
require 'set'

first_card = ""
second_card = ""
total_card_value = ""
dealer_first_card = ""

type_of_user_hand = ""

table1 = {}
table2 = {}


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







  dealer_options = [2,3,4,5,6,7,8,9,10,1]
  hard_user_options = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
  type = ["Hard", "Soft", "Pair"]

###
def repeatedly_ask_a_question(person, info_type1, info_type2, array1, array2)
  array1.each do |element1|
    person[info_type1] << element1
  end

  array2.each do |element2|
    person[info_type2] << element2
  end

  return person
end

table1["Hard"] = {
  "dealer" => Set.new,
  "user" => Set.new
}


# table2["dealer"] = {
#   "user" => Set.new
# }

table1["Hard"] = repeatedly_ask_a_question(table1["Hard"], "dealer", "user", dealer_options, hard_user_options)
# table2["dealer"] = repeatedly_ask_a_question(table2["dealer"], "user", hard_user_options)

puts table1
puts ''
# puts table2
puts ''

###

  #table = Set.new[dealer_options.zip(hard_user_options.map {|i| i.include?(',') ? (i.split /, /) : i})]

# puts table
#
# => 2,   3,   4,   5,  6,7, 8,    9,   10,    1
hard_type_solutions = {
  5 => ["H", "H", "H", "H", "H", "H", "H", "H", "H", "H"],
  6 => ["H", "H", "H", "H", "H", "H", "H", "H", "H", "H"],
  7 => ["H", "H", "H", "H", "H", "H", "H", "H", "H", "H"],
  8 => ["H", "H", "H", "Dh", "Dh", "H", "H", "H", "H", "H"],
  9 => ["Dh" "Dh", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  10 => ["Dh" "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "H", "H"],
  11 => ["Dh" "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh"],
  12 => ["H" "H", "S", "S", "S", "H", "H", "H", "H", "H"],
  13 => ["S" "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  14 => ["S" "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  15 => ["S" "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  16 => ["S" "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  17 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  18 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  19 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  20 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  21 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"]
}

soft_type_solutions = {
  13 => ["H", "H", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  14 => ["H", "H", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  15 => ["H", "H", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  16 => ["H", "H", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  17 => ["Dh", "Dh", "Dh", "Dh", "Dh", "H", "H", "H", "H", "H"],
  18 => ["S", "Ds", "Ds", "Ds", "Ds", "S", "S", "H", "H", "S"],
  19 => ["S", "S", "S", "S", "Ds", "S", "S", "S", "S", "S"],
  20 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  21 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"]
}

pair_type_solutions = {
4 => ["P", "P", "P", "P", "P", "P", "H", "H", "H", "H"],
6 => ["P", "P", "P", "P", "P", "P", "P", "H", "H", "H"],
8 => ["H", "H", "P", "P", "P", "H", "H", "H", "H", "H"],
10 => ["Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "H", "H"],
12 => ["P", "P", "P", "P", "P", "P", "H", "H", "H", "H"],
14 => ["P", "P", "P", "P", "P", "P", "P", "H", "S", "H"],
16 => ["P", "P", "P", "P", "P", "P", "P", "P", "P", "P"],
18 => ["P", "P", "P", "P", "P", "S", "P", "P", "S", "S"],
20 => ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
2 => ["P", "P", "P", "P", "P", "P", "P", "P", "P", "P"]
}

def choose_table(type_chose)
  if type_chose == "Hard"
    hard_type_solutions
  elsif type_chose == "Soft"
    soft_type_solutions
  elsif type_chose == "Pair"
    pair_type_solutions
  else
    puts "ERROR, table type not selected"
  end
end




keys = hard_type_solutions.keys
to_find_index = hard_type_solutions[keys[total_card_value-5]]

puts ''

puts to_find_index[dealer_first_card-2]
