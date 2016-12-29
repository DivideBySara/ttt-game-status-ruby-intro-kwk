# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # 1st column
  [1, 4, 7], # 2nd column
  [2, 5, 8], # 3rd column
  [0, 4, 8], # upper-left to lower-right diagonal
  [2, 4, 6]  # upper-right to lower-left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # get indices of each win_combination
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    # get values from board that map to each index in each win_combination
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # Are all values X's?
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end # else not a win_combination

  end # WIN_COMBINATIONS.each iteration

  return false
end #won?

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  # if winner is an array, change winner to winning character
  if winner.class == Array
    winner = board[winner[0]]
  end # else winner is nil
end
