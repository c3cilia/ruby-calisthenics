require 'rock_paper_scissors'
require 'byebug'

describe RockPaperScissors do
  before(:each) do
    @rock = ['Kimani','R'] ; @paper = ['Kevo','P'] ; @scissors = ['Cess','S']
  end
  describe 'game' do
    it 'rock breaks scissors [10 points]' do
      expect(RockPaperScissors.winner(@rock, @scissors)).to be == @rock
    end
    it 'scissors cut paper [10 points]' do
      expect(RockPaperScissors.winner(@paper, @scissors)).to be == @scissors
    end
    it 'paper covers rock [10 points]' do
      expect(RockPaperScissors.winner(@rock, @paper)).to be == @paper
    end
    it 'first player wins if both use same strategy [10 points]' do
      expect(RockPaperScissors.winner(@scissors, ['Dave','S'])).to be == @scissors
    end
  end
  it "should raise NoSuchStrategyError if strategy isn't R, P, or S [10 points]" do
    expect(lambda{RockPaperScissors.winner(@rock, ['Dave', 'w'])}).to raise_error(
      RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S")
  end
  describe 'tournament' do
    it 'base case [20 points]' do
      expect(RockPaperScissors.tournament_winner([@rock,@paper])).to be == @paper
    end

    it 'recursively make it work for four a tournament between 8 players' do
       tourney = [
        [
          [ ["John", "P"], ["Kelvin", "S"] ],      
          [ ["Mick", "R"], ["Fred", "S"] ]
        ],
        [
          [ ["Anne", "S"], ["Cess", "P"] ],
          [ ["Renice", "R"], ["Patrick", "P"] ]
        ]
      ]
      expect(RockPaperScissors.tournament_winner(tourney)).to be == ['Mick', 'R']
    end 
    it 'It should still work for a tournament between 50 people' do
      tourney = [
        [['Velia Chesser ', 'P'], ['Yaeko Kamer ', 'S']], 
        [['Donte Salais ', 'P'], ['Annamaria Canterbury ', 'P']], 
        [['Gia Rutten ', 'R'], ['Clarita Shy ', 'S']], 
        [['Lou Teaster ', 'R'], ['Samira Lebeau ', 'P']], 
        [['Isaias Knudtson ', 'R'], ['Ethel Denson ', 'S']], 
        [['Trish Fowkes ', 'R'], ['Noble Denzer ', 'S']], 
        [['Zelma Spinner ', 'S'], ['Tressa Winfield ', 'P']], 
        [['Chelsie Sholes ', 'P'], ['Marget Portier ', 'S']], 
        [['Charlie Kemper ', 'R'], ['Elmo Hartz ', 'P']], 
        [['Lavera Letchworth ', 'R'], ['Tammie Elsberry ', 'R']], 
        [['Argentina Wojcik ', 'S'], ['Johana Muller ', 'S']], 
        [['Tory Chapell ', 'P'], ['Jeanetta Sarinana ', 'P']], 
        [['Kandy Devlin ', 'S'], ['Rosalia Manigault ', 'P']], 
        [['Melynda Iraheta ', 'P'], ['Ebony Villalon ', 'P']], 
        [['Katina Gaudin ', 'P'], ['Del Mysliwiec ', 'R']], 
        [['Pearly Doolittle ', 'P'], ['Lilliana Kreiner ', 'P']], 
        [['Sanjuanita Bragg ', 'P'], ['Manual Yoshioka ', 'S']], 
        [['Dorla Toliver ', 'S'], ['Hubert Chauvin ', 'P']], 
        [['Sherril Powell ', 'R'], ['Gerardo Prioleau ', 'S']], 
        [['Dick Gault ', 'S'], ['Carmelina Colberg ', 'P']], 
        [['Jarrod Brodsky ', 'S'], ['Felipe Rogerson ', 'S']], 
        [['Janette Tramel ', 'P'], ['Blanche Gwyn ', 'R']], 
        [['Kelvin Castiglia ', 'S'], ['Danika Brenneman ', 'P']], 
        [['Antone Pirkle ', 'R'], ['Bunny Linz ', 'P']], 
        [['Danielle Loso ', 'R'], ['Ocie Rolfe', 'S']]
      ]

      expect(RockPaperScissors.tournament_winner(tourney)).to be == ["Yaeko Kamer ", "S"]
    end
  end
end
