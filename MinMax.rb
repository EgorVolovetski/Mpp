class BattleshipGame
    def initialize
      @board_size = 5
      @board = Array.new(@board_size) { Array.new(@board_size, ' ') }
      @ships = [[2, 2], [3, 2], [4, 2]]
      @max_depth = 3
    end
  
    def print_board
      puts "  0 1 2 3 4"
      @board.each_with_index do |row, i|
        puts "#{(0.ord + i)} #{row.join('.')}"
      end
    end
  
    def place_ships
      @ships.each { |ship| x, y = ship; @board[y][x] = 'S' }
    end
  
    def game_over?
      @ships.all? { |ship| x, y = ship; @board[y][x] == 'X' }
    end
  
    def valid_move?(x, y)
      x >= 0 && x < @board_size && y >= 0 && y < @board_size
    end
  
    def make_move(x, y)
      if valid_move?(x, y)
        if @board[y][x] == 'S'
          puts "You hit a ship!"
          @board[y][x] = 'X'
        else
          puts "You missed."
          @board[y][x] = 'O'
        end
        return true
      else
        puts "Invalid move."
        return false
      end
    end
  
    def minimax(depth, maximizing_player)
      if depth == 0 || game_over?
        return 0
      end
  
      if maximizing_player
        max_eval = -Float::INFINITY
        @board.each_with_index do |row, y|
          row.each_with_index do |cell, x|
            if cell == ' '
              @board[y][x] = 'X'
              eval = minimax(depth - 1, false)
              @board[y][x] = ' '
              max_eval = [max_eval, eval].max
            end
          end
        end
        return max_eval
      else
        min_eval = Float::INFINITY
        @board.each_with_index do |row, y|
          row.each_with_index do |cell, x|
            if cell == ' '
              @board[y][x] = 'X'
              eval = minimax(depth - 1, true)
              @board[y][x] = ' '
              min_eval = [min_eval, eval].min
            end
          end
        end
        return min_eval
      end
    end
  
    def computer_move
      best_move = nil
      best_eval = -Float::INFINITY
  
      @board.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          if cell == ' '
            @board[y][x] = 'X'
            eval = minimax(@max_depth, false)
            @board[y][x] = ' '
            if eval > best_eval
              best_eval = eval
              best_move = [x, y]
            end
          end
        end
      end
  
      x, y = best_move
      puts "Computer fires at (#{x}, #{y})"
      make_move(x, y)
    end
  
    def play
      place_ships
      
      while !game_over?
        print_board
        puts "Your turn: Enter coordinates (x y): "
        x, y = gets.chomp.split.map(&:to_i)
        if make_move(x, y)
          break if game_over?
          computer_move
        end
      end
      puts "Game over! You win!" if game_over?
    end
  end
  
  game = BattleshipGame.new
  game.play
  