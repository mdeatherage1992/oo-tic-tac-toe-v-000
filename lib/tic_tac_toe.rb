class TicTacToe

  def board=(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end


  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn_count
   @board.count{|token| token == "X" || token == "O"}
 end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def won?
  WIN_COMBINATIONS.detect do |mini|
  if  mini.all? { |space| board[space] == "X"}
    return mini
  elsif mini.all? { |space| board[space] == "O"}
    return mini
  end
  end
end

def full?(board)
  board.all? do |space|
    if space == " "
      false
    else
      true
    end
  end
end

def draw?(board)

full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
  if full?(board)
    true
  end
  if won?(board)
    false
  else
    true
  end
end

def over?(board)
  if !full?(board) && !won?(board)
    false
  else
    true
  end

end

def winner(board)
  if wonder?(board) == "X"
    "X"
  elsif wonder?(board) == "O"
    "O"
  else
    nil
  end
end

    def wonder?(board)
      WIN_COMBINATIONS.detect do |mini|
      if  mini.all? { |space| board[space] == "X"}
        return "X"
      elsif mini.all? { |space| board[space] == "O"}
        return "O"
      end
    end
  end

  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def turn_count(board)
  count = 0
  board.each do |spaces|
    if spaces != " "
      count = count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
  "O"
  end
end



def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if wonder?(board) == "X"
    puts "Congratulations X!"
  elsif wonder?(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


end
