class CLI
    def initialize
        
    end

    def run 
        system('clear')
        greeting
        while menu != 'exit'

        end

        end_program
    end

    def greeting
        puts "Welcome to the Covid-19 CLI Tracker!"
    end

    def menu
        # list_options
        list_options
        # get user input
        puts "Which one do you prefer?"
        input= gets.chomp
        choose_options(input)
        return input
        
    end

    def list_options
        puts "1."
        puts "2."
        puts "3."
        puts
    end

    def choose_options(input)
        case input
        when "1"
            puts "Number 1 chosen"
            when "2"
                puts "Number 2 chosen"
        end

    end

    def end_program
        puts "See you later!"
    end
end
