module  Configure           
  class Config
    class << self
      attr_accessor :show_ffi, :show_game
      def welcome

        puts "alternatives are:\n :sokoban, :gears, :tictactien"
      end

      def start

        @show_game = :sokoban #default game 
      end

      def update arg #update the game we want to play
        @show_game = arg.to_sym
      end

      def detect  #detect ruby version + decide if we want to use ffi-opengl
        puts 'ruby in use:'
        rubyv  =  RUBY_VERSION 
        if rubyv == "1.9.1"
          puts "1.9.1"
          @show_ffi = false                 
        elsif rubyv == "1.9.2"
          puts "1.9.2"
          @show_ffi = true                 
        else
          exit
        end       
      end
    end
  end
end

