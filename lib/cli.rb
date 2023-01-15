require "pry"

class CLI
  attr_accessor :user

  def initialize
  end

  def run
    Scraper.scrape_information
    User.seed
    system("clear")
    greeting
    count = login_or_signup
    while count < 3 && menu != "exit"
    end
    if count >= 3
      puts "Too many login attemps."
    end
    end_program
  end

  def login_or_signup
    response = ""

    while response != "login" && response != "signup"
      puts "Would you like to login or signup for a new account?"
      response = gets.chomp.downcase
    end

    if response == "login"
      login
    else
      signup
    end
  end

  def signup
    puts "Lets get you signed up for a new account!"
    puts "Enter your new username:"
    username = gets.chomp
    puts "Enter your new password:"
    password = gets.chomp

    User.new(username, password)
    login
  end

  def login
    authenticated = false
    count = 1

    while authenticated != true && count <= 3
      puts "Please login."
      puts "What is your username?"
      print "> "
      username = gets.chomp
      puts "What is your password?"
      print "> "
      password = gets.chomp
      puts
      currUser = Auth.authenticate_user(User.all, username, password)

      if currUser
        puts "Login sucessful!"

        authenticated = true
        @user = currUser
        greet_user
      else
        count += 1
        puts "Username or password is incorrect. Please try again"
        puts
      end
    end

    return count
  end

  def greeting
    puts "Welcome to the Covid-19 CLI Tracker!"
    puts
  end

  def greet_user
    puts "Welcome #{@user.username}!"
    puts
  end

  def menu
    # list_options
    list_options
    # get user input
    puts "Which one do you prefer?"
    input = gets.chomp
    choose_options(input)
    return input
  end

  def list_options
    puts "Make a selection:"
    puts "1. Country total U.S. Information"
    puts "2. Show all states information"
    puts "3. Top 10 states with the most confirmed cases"
    puts "4. Top 10 states with the least confirmed cases"
    puts
  end

  def choose_options(input)
    case input
    when "1"
      puts "Number 1 chosen"
      usa = Country.all[0]
      puts usa.name
      puts "Confirmed Cases: #{usa.confirmed_cases}"
      puts "Overall Deaths: #{usa.overall_deaths}"
      puts "Recovery Cases: #{usa.recoveries}"
      puts
    when "2"
      puts "Number 2 chosen"
      State.all.each_with_index do |state, i|
        puts "#{i +1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
      end
      puts
    when "3"
        puts "Number 3 chosen"
        State.all[0..9].each_with_index do |state, i|
          puts "#{i +1}. #{state.name} confirmed cases: #{state.confirmed_cases}"
        end
        puts

    when "4"
        puts "Number 3 chosen"
        states = State.all.sort_by{|state| state.confirmed_cases}
        states[0..9].each_with_index do |state, i|
          puts "#{i +1}. #{state.name} confirmed cases: #{state.confirmed_cases}"
        end
        puts
    end
  end

  def end_program
    puts "See you later!"
  end
end
