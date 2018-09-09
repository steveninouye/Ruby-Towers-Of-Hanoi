require "byebug"

# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

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

