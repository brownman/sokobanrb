require 'spec_helper'



describe Sokoban1::Render do

  before(:each) do
   @game =  Sokoban1::Render.init_soko  #generate instance of the game of type
  end

  it 'should create a new instance of the class' do
    @game.class.should == Sokoban1::Sokoban.new.class
  end

  it 'should have a set of charecters we know how to render'  do 
   game_simbolic_chars = ""
   game_simbolic_chars =  Sokoban1::Render.know_to_draw  #operate on the same initiated  game
 game_simbolic_chars =  game_simbolic_chars.split ""
 game_simbolic_chars.uniq!

 #set1.class.should == Set
 #

collect_symbols = [" ", "@", "\n", "o", ".", "#" ]

 game_simbolic_chars.should_not  == collect_symbols #array treat ordering

 game_simbolic_chars.sort.should == collect_symbols.sort #sort to ignore different order 
 game_simbolic_chars.to_set.should == collect_symbols.to_set #or use convert to class Set

  end
end

