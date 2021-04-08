class Games
    def gamble
        puts "How much would you ike to bet"
        bet = gets.to_i
        case bet
        when (@balance - bet) <= 0
            raise "Invalid Bet, Insufficient Funds"
        end
    end
    def game_menu
        game_menu = TTY::Prompt.new
        choice = game_menu.select("Please Select from the Following Options", ['Play' , 'Rules', 'Back'])
        case choice
        when "Play"
            game()
        when "Rules"
            rules()
        when "Back"
            input_loop(true, @name, @balance)
        end
    end
    def stats
        puts "Total Games Played: #{@tally}"
        puts "Total Money Gambled: #{@total_gambled}"
        puts "Total Games Won: #{@games_won}"
        puts "Total Games Lost: #{@games_lost}"
    end
end