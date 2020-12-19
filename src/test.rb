require "bundler"
require "tty-prompt" 
require "colorize"

require 'yaml'
require_relative ("classes.rb")

$prompt = TTY::Prompt.new

def select_option
    puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" # used to identify menu option easily
    return $prompt.select("Choose from one of the following options", 
    ["Create a new profile", "Load an existing profile", "Go to Quiz Menu", "Show your Scores", "Exit"])
end #end of method

def quiz_menu_select
    puts "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ" # used to identify menu option easily
    return $prompt.select("Choose from one of the quiz categories", 
    ["Capital Cities", "Countries", "Geography", "Back to Main Menu"])
end #end of method

def city_menu_select
    puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC" # used to identify menu option easily
    return $prompt.select("Choose from one of quiz levels", 
    ["Easy", "Medium", "Hard", "Back to the Quiz Menu"]) 
end

def city_menu(option)
    answer = option
    while answer != "Exit"
        case answer
            when "Easy"
                puts "Loading the EASY capital city quiz!"
                run_test(questions_capital_city_easy)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                system("clear")
            when "Medium"
                puts "Loading the MEDIUM capital city quiz!"
                run_test(questions_capital_city_medium)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                system("clear")
            when "Hard"
                puts "Loading the HARD capital city quiz!"
                run_test(questions_capital_city_hard)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                system("clear")
            when "Back to the Quiz Menu"
                puts "Returning to the quiz menu"
                sleep(1)
                system("clear")
                option = quiz_menu_select
                quiz_menu(option)
                puts " "
        end #end of case statement
    end #end of while loop
end #end of method

def quiz_menu(option)
    answer = option  
    while answer != "Exit"
        case answer
            when "Capital Cities"
                puts "Displaying Capital Cities quizzes"
                sleep(1)
                system("clear")
                option = city_menu_select
                city_menu(option)
            when "Countries"
                puts "Displaying the Countries quizzes"
            when "Geography"
                puts "Displaying the Geography quizzes" 
            when "Back to Main Menu"
                puts "Going back to the main menu"
                option = select_option
                sleep(1.0)
                system("clear")
        end #end of case statement
    end #while loop
end #end of method

answer = ""
while answer != "Exit"
    answer = select_option
    case answer
    when "Create a new profile"
        puts "Let's get started and create a new profile for you!"
        puts " "
        sleep(1)
        create_member   
    when "Load an existing profile"
        puts "Loading your profile..."
        puts " "
        # Invoke a method called existing_member
        # existing_member
    when "Go to Quiz Menu"
        puts "Going to the quiz menu"
        sleep(1)
        system("clear")
        option = quiz_menu_select
        quiz_menu(option)
    when "Show your Scores"
        puts "Showing your scores"
    when "Exit"
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++" # used to identify menu option easily
        puts "Exiting from the Quiz App, Goodbye! Please come back!!".yellow
        break
    end # end of the case statement
end # end of while loop