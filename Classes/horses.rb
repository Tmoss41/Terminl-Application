require_relative 'games'
class HorseRacing < Games
    def initialize(balance, name)
        @balance = balance
        @name = name
    end
    def rules
        puts "
        ██████╗░██╗░░░██╗██╗░░░░░███████╗░██████╗
        ██╔══██╗██║░░░██║██║░░░░░██╔════╝██╔════╝
        ██████╔╝██║░░░██║██║░░░░░█████╗░░╚█████╗░
        ██╔══██╗██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
        ██║░░██║╚██████╔╝███████╗███████╗██████╔╝
        ╚═╝░░╚═╝░╚═════╝░╚══════╝╚══════╝╚═════╝░"
        puts "A List of Horses that are racing will be shown"
        puts "Enter the amount you wish to bet and on what Horse"
        puts "See if you win"
        back = gets.chomp
            if back == "back"
               menu()
            end
    end
# Ask how much they want to gamble
# Give a list of Horses from a list of names
# Randomly Pick a horse to win
    def game
        horse_playing = true
        while horse_playing == true
            selecting = TTY::Prompt.new
            horses = ['PinkLightning', 'WildCat', 'Eclipse', 'Delphi', 'TheDaringDrunk', 'CrazySisterSeline', 'JackSparrow', 'RunningBull']
            racers = []
            selector = 0
            4.times{
                racer = horses.sample
                horses.delete(racer)
                racers.push(racer)
            }
            puts "The following horses are racing"
            puts racers
            choice = selecting.select("Who do you think will win", racers)
            puts "How much would you like to bet on #{choice}"
            bet = gets.to_i
            winner = racers.sample
            case winner.downcase.include?(choice)
            when true
                puts "#{winner} comes thundering over the line, you have won this time"
                @balance = bet + @balance
            when false
                puts "#{winner} comes in first, better luck next time!"
                @balance = @balance - bet
            end
            horse_input = selecting.select("Would you like to bet on the next race" , ["Yes","No"])
            case horse_input
            when "Yes"
            when "No"
                horse_playing = false
            end 
        end
        puts "Returning to Game Menu"
        game_menu()
    end
end