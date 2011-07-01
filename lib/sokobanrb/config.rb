module Sokoban1            
  class Config
    class << self
      attr_accessor :show_ffi
      def detect
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

