class RockPaperScissors
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  def self.winner(player1, player2)
  	choice = %w(R P S)
  	raise RockPaperScissors::NoSuchStrategyError.new("Strategy must be one of R,P,S") \
  		unless (choice.include? player2[1]) && (choice.include? player1[1])
  	player2_choice_index = choice.index(player2[1]) 
  	if player1[1] == choice[player2_choice_index]
  		return player1 
  	elsif player1[1] == choice[player2_choice_index - 1]
  		return player2
  	else 
  		return player1
  	end
  end
  def self.tournament_winner(tournament)
  	if tournament[0][0].is_a? String
  		return RockPaperScissors::winner(tournament[0], tournament[1])
   	end
   	tournament1, tournament2 = tournament
   	winner1 = RockPaperScissors::tournament_winner(tournament1)
   	winner2 = RockPaperScissors::tournament_winner(tournament2)
   	return RockPaperScissors::winner(winner1, winner2)
  end
end