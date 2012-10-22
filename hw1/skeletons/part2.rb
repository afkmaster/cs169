class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
	if m1[1].downcase.match(/[rps]/) == nil || m2[1].downcase.match(/[rps]/) == nil
		raise NoSuchStrategyError
	end
	case
	when m1[1].downcase == "r" && m2[1].downcase == "p"
		m2
	when m1[1].downcase == "r" && m2[1].downcase == "s"
		m1
	when m1[1].downcase == "p" && m2[1].downcase == "r"
		m1
	when m1[1].downcase == "p" && m2[1].downcase == "s"
		m2
	when m1[1].downcase == "s" && m2[1].downcase == "r"
		m2
	when m1[1].downcase == "s" && m2[1].downcase == "p"
		m1
	when m1[1].downcase == m2[1].downcase
		m1
	end
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
	if tournament[0][0].kind_of?(String)
		rps_game_winner(tournament)
	else
		subTourney1 = rps_tournament_winner(tournament[0])
		subTourney2 = rps_tournament_winner(tournament[1])
		rps_game_winner([subTourney1, subTourney2])
	end
end