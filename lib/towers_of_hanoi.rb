class TowersOfHanoi
    attr_reader :towers

    def initialize
        @towers = [[3,2,1],[],[]]
    end

    def play        
        while true
            render
            puts "Select a tower to move from:"
            fr_input = gets.chomp
            fr_tower = "012".include?(fr_input) ? fr_input.to_i : 10
            puts "Select a tower to move to:"
            to_input = gets.chomp
            to_tower = "012".include?(to_input) ? to_input.to_i : 10
            if valid_move?(fr_tower, to_tower)
                move(fr_tower, to_tower)
                break if won?
            else
                puts "That is not a valid move"
            end
        end
        winning_msg
    end

    def render
        puts "\n================\n\n"
        p @towers
        puts "\n================\n\n"
    end

    def won?
        @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
    end

    def valid_move?(fr_tower, to_tower)
        fr_tower >= 0 && fr_tower <= 2 && to_tower >= 0 && to_tower <= 2 && @towers[fr_tower][-1] && (!@towers[to_tower][-1] || @towers[fr_tower][-1] < @towers[to_tower][-1])
    end

    def move(fr_tower, to_tower)
        disc = @towers[fr_tower].pop
        @towers[to_tower].push(disc)
    end

    def winning_msg
        puts "YOU WON THE GAME"
        puts "CONGRATULATIONS!!!!!!!!!"
    end
end

# game = TowersOfHanoi.new
# game.play