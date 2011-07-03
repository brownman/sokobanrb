require 'spec_helper'



describe Configure::Config do

  before(:each) do
    Configure::Config.start
  end


  it 'should setup the name of the game' do 
    Configure::Config.show_game.should == :gears
    
    Configure::Config.update "sokoban"
    Configure::Config.show_game.should == :sokoban
    Configure::Config.show_game.should_not == :tictactien
  end
end

