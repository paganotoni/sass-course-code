class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

VALID_STRATEGYS = %w{R P S}
WINNING_RULES = { "R"=> "S" ,"P"=> "R" , "S"=> "P" }

def rps_game_winner( data )
  raise WrongNumberOfPlayersError if data.length != 2
  data.each do |name , player_strategy| 
    raise NoSuchStrategyError unless VALID_STRATEGYS.include? player_strategy  
  end

  first_player_strategy = data[0][1]
  second_player_strategy = data[1][1]

  return data[0] if first_player_strategy == second_player_strategy
  return data[0] if WINNING_RULES[first_player_strategy] == second_player_strategy
  return data[1] if WINNING_RULES[first_player_strategy] != second_player_strategy
end

def rps_tournament_winner( data )
  if data[0][0].instance_of? String
    data = rps_game_winner( data )
  else
    while !data[0][0].instance_of? String do
      data[0] = rps_tournament_winner( data[0] )
      data[1] = rps_tournament_winner( data[1] )
    end

    data = rps_game_winner( data )
  end
  

  return data
end

