# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

# we can use the these in my solution:
# - Your code can also use the classes and methods in
# hw6graphics.rb (as well as the classes and methods in hw6provided.rb), except for the methods
# marked with comments as not to be called by student code

class MyPiece < Piece
    # The constant All_My_Pieces should be declared here
  
    # your enhancements here
  
  end
  
  class MyBoard < Board
    # your enhancements here
  
  end
  
  class MyTetris < Tetris
    # your enhancements here
    def key_bindings
      k_b = super
      k_b
      @root.bind("u", proc {@board.rotate_clockwise; @board.rotate_clockwise})
    end
  end
  
  