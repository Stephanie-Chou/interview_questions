#!/usr/bin/env ruby
require "./tetrislib"
require "./board"
require "./piece"
require 'pry'
# This is some skeleton code for tetris, you will have to fill in the TODOs in this file, board.rb, and
# piece.rb, as well as add more code to complete the game.
# Feel free to change anything, or not use this skeleton at all.
class Tetris
  include TetrisLib
  attr_accessor :current_piece, :board

  def initialize
    @board = Board.new
    @score = 0
    @current_piece = chooseNextPiece
    @nextPiece = chooseNextPiece
  end

  def gameOver?
    if @board.cells[0][3] == 1
      p "GAME OVER"
      puts "Score: #{@score}"
      return true
    end
  end

  def chooseNextPiece
    shapes = [Shapes::S,Shapes::T,Shapes::SQUARE, Shapes::I, Shapes::L, Shapes::Z, Shapes::J]
    # This will put a random piece in the upper center.
    Piece.new(3, 0, shapes.sample)
  end

  def quickdrop
    until @board.collide?(@current_piece)
      @current_piece.move(0,1)
    end
    anchorPiece
  end

  def anchorPiece
    @current_piece.move(0,-1)
    @board.place_piece(@current_piece)
    @score += @board.clear_lines
    @current_piece = @nextPiece
    @nextPiece = chooseNextPiece
  end

  def previewNextPiece
    puts "| Next Piece |"
    @nextPiece.piece_cells.each_with_index do |row, j|
      row.each_with_index do |cell, i|
        print @nextPiece.piece_cells[j][i] == 1 ? "#" : " "
      end
      puts ""
    end
  end

  def play
    # Main game loop that runs until ctrl-c is pressed to quit the game.
    while(true)
      previewNextPiece
      @board.place_piece(current_piece)
      @board.draw()
      @board.remove_piece(current_piece)
      puts "Score: #{@score}"

      # This code waits for input until the user hits a keystroke.
      key = get_input()

      # dont move it unless it will not collide
      case key
      when :left
        @current_piece.move(-1,0)
        if @board.collide?(@current_piece)
          @current_piece.move(1,0)
        end
      when :right
        @current_piece.move(1,0)
        if @board.collide?(@current_piece)
          @current_piece.move(-1,0)
        end
      when :up
        @current_piece.rotate
        if @board.collide?(@current_piece)
          current_piece.rotate(:clockwise)
        end
      when :down
        @current_piece.move(0,1)
        if @board.collide?(@current_piece)
          anchorPiece
          break if gameOver?
        end
      when :space
        quickdrop
        break if gameOver?
      end
      # Print keypress for debugging.


      puts "Received the keystroke #{key.inspect}"
    end
  end
end

# Launch the game
Tetris.new.play()
