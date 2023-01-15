class CLI
    def initialize
        
    end

    def run 
        system('clear')
        greeting
        end_program
    end

    def greeting
        puts "Welcome to the Covid-19 CLI Tracker!"
    end

    def end_program
        puts "See you later!"
    end
end
