#!/usr/bin/env ruby

require "yaml"

module Sokoban1
class Sokoban
  WALL				= "#"
  OPEN_FLOOR			= " "

  MAN					= "@"
  CRATE				= "o"

  STORAGE				= "."
  MAN_ON_STORAGE		= "+"
  CRATE_ON_STORAGE	= "*"

  MAX_UNDO			= 10

  PATH				= File.expand_path(File.dirname(__FILE__))

  attr_reader :level, :moves

  def self.load( file = File.join(PATH, "sokoban_saved_game.yaml") )
    game = nil

    File.open file do |f|
      game = YAML.load(f)
    end

    game ||= Sokoban.new
    game
  end

  def initialize( file = File.join(PATH, "sokoban_levels.txt") )
    @level_file = file

    @board = [ ]
    @level = 0
    @over = false

    @undos = [ ]
    @moves = 0

    load_level
  end

  def can_move_down?( )	can_move? :down		end
  def can_move_left?( )	can_move? :left		end
  def can_move_right?( )	can_move? :right	end
  def can_move_up?( )		can_move? :up		end

  def display
    @board.inject("") { |dis, row| dis + row.join + "\n" }
  end

  def level_solved?
    @board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        return false if cell == CRATE
      end
    end
    true
  end

  def load_level( level = @level += 1, file = @level_file )
    loaded = false

    File.open file do |f|
      count = 0
      while lvl = f.gets("")
        count += 1
        if count == level
          @board = [ ]
          lvl.chomp!
          lvl.each_line { |e| @board << e.chomp.split("") }
          loaded =  true
          break
        end
      end
    end

    if loaded
      @undos = [ ]
      @moves = 0
    else
      @over = true
    end

    loaded
  end

  def move_down( )	move :down		end
  def move_left( )	move :left		end
  def move_right( )	move :right	end
  def move_up( )		move :up		end

  def over?
    @over
  end

  def restart_level
    load_level @level
  end

  def save( file = File.join(PATH, "sokoban_saved_game.yaml") )
    File.open(file, "w") do |f|
      f << YAML.dump(self)
    end
  end

  def undo
    if @undos.size > 0
      @board = @undos.pop
      @moves -= 1
    end
  end

  private

  def can_move?( dir )
    x, y = where_am_i
    case dir
    when :down
      first = @board[y + 1][x]
      second = y < @board.size - 2 ? @board[y + 2][x] : nil
    when :left
      first = @board[y][x - 1]
      second = x >= 2 ? @board[y][x - 2] : nil
    when :right
      first = @board[y][x + 1]
      second = x < @board[y].size - 2 ? @board[y][x + 2] : nil
    when :up
      first = @board[y - 1][x]
      second = y >= 2 ? @board[y - 2][x] : nil
    end

    if first == OPEN_FLOOR or first == STORAGE
      true
    elsif not second.nil? and
      (first == CRATE or first == CRATE_ON_STORAGE) and
      (second == OPEN_FLOOR or second == STORAGE)
      true
    else
      false
    end
  end

  def move( dir )
    return false unless can_move? dir

    @undos << Marshal.load(Marshal.dump(@board))
    @undos.shift if @undos.size > MAX_UNDO
    @moves += 1

    x, y = where_am_i
    case dir
    when :down
      if @board[y + 1][x] == CRATE or @board[y + 1][x] == CRATE_ON_STORAGE
        move_crate x, y + 1, x, y + 2
      end
      move_man x, y, x, y + 1
    when :left
      if @board[y][x - 1] == CRATE or @board[y][x - 1] == CRATE_ON_STORAGE
        move_crate x - 1, y, x - 2, y
      end
      move_man x, y, x - 1, y
    when :right
      if @board[y][x + 1] == CRATE or @board[y][x + 1] == CRATE_ON_STORAGE
        move_crate x + 1, y, x + 2, y
      end
      move_man x, y, x + 1, y
    when :up
      if @board[y - 1][x] == CRATE or @board[y - 1][x] == CRATE_ON_STORAGE
        move_crate x, y - 1, x, y - 2
      end
      move_man x, y, x, y - 1
    end
    true
  end

  def move_crate( from_x, from_y, to_x, to_y )
    if @board[to_y][to_x] == STORAGE
      @board[to_y][to_x] = CRATE_ON_STORAGE
    else
      @board[to_y][to_x] = CRATE
    end
    if @board[from_y][from_x] == CRATE_ON_STORAGE
      @board[from_y][from_x] = STORAGE
    else
      @board[from_y][from_x] = OPEN_FLOOR
    end
  end

  def move_man( from_x, from_y, to_x, to_y )
    if @board[to_y][to_x] == STORAGE
      @board[to_y][to_x] = MAN_ON_STORAGE
    else
      @board[to_y][to_x] = MAN
    end
    if @board[from_y][from_x] == MAN_ON_STORAGE
      @board[from_y][from_x] = STORAGE
    else
      @board[from_y][from_x] = OPEN_FLOOR
    end
  end

  def where_am_i
    @board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        return x, y if cell == MAN or cell == MAN_ON_STORAGE
      end
    end
  end
end
end
