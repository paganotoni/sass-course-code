require 'minitest/spec'
require 'minitest/autorun'

describe 'RockPaper' do

  it "should raise WrongNumberOfPlayersError if player number is different of 2" do
    lambda{ rps_game_winner( [ [ "Armando", "P" ], [ "Dave", "S" ] , ["JUANCHO", 'S']]  )}.must_raise( WrongNumberOfPlayersError  )  
  end

  it "should raise NoSuchStrategy if a player uses an strategy different than R,P,S " do
    lambda{ rps_game_winner( [ [ "Armando", "P" ], [ "Dave", "W" ]] )}.must_raise( NoSuchStrategyError )
  end

  it "should return winning the first if are equals" do
    rps_game_winner( [ [ "Armando", "P" ], [ "Wi", "P" ]]  ).must_equal ["Armando", 'P']
  end

  it "should set wining P over R" do
    rps_game_winner( [ [ "Armando", "P" ], [ "Dave", "R" ]]  ).must_equal ["Armando", 'P']
  end

  it "should set winning R over S" do
    rps_game_winner( [ [ "Armando", "S" ], [ "Dave", "R" ]]  ).must_equal ["Dave", 'R']
  end

  it "should set winning S over P" do
    rps_game_winner( [ [ "Armando", "P" ] , ["Juancho", 'S']] ).must_equal ["Juancho", 'S']
  end

  it "should set winning person for a tournament" do
    data = [
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
      ],
      [ 
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
    ]

    rps_tournament_winner(data).must_equal( ["Richard", "R"] )
  end
  
end

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


