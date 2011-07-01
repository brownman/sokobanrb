# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
#require "sokoban/version"

Gem::Specification.new do |s|
  s.name        = "sokobanrb"
  s.version     = "0.0.3"
  s.authors     = ["brownman"]
 
  s.email       = ["ofer.shaham@gmail.com"]

  s.homepage    = "https://github.com/brownman/sokoban.rb"

 
  s.summary     = %q{just adding code to ruby quiz 5 solution of James Edward Gray II from  grayproductions.net }
  s.description = %q{in order to have fun playing with opengl, i use existing sokoban project , so no rights have reserved for me :(}


  s.executables  = ["sokobanrb"]
 
  
  if RUBY_VERSION == "1.9.1"
   s.add_development_dependency "ruby-opengl"
 elsif RUBY_VERSION == "1.9.2"
   s.add_development_dependency "ffi-opengl"
 end


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
