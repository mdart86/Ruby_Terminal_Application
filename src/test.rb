require "bundler"
require "tty-prompt" 
require "colorize"

require 'yaml'
require_relative ("classes.rb")

$prompt = TTY::Prompt.new

def select_option
    return $prompt.select("Choose from one of the following options", 
    ["Create a new profile", "Load an existing profile", "Go to Quiz Menu", "Show your Scores", "Exit"])
end #end of method

def quiz_menu_select
    return $prompt.select("Choose from one of the quiz categories", 
    ["Capital Cities", "Countries", "Geography", "Back to Main Menu"])
end #end of method

def quiz_menu
    answer = ""
    while answer != "Exit"
        answer = quiz_menu_select
        case answer
            when "Capital Cities"
                puts "Displaying capital cities menu"
                city_menu
                sleep(1)
                puts " "         
            when "Countries"
                puts "Loading the Countries quizzes"
            when "Geography"
                puts "Loading the Geography quizzes" 
            when "Back to Main Menu"
                sleep(0.5)
                puts "Going back to the main menu"
                select_option
                sleep(1.0)
        end #end of case statement
    end #while loop
end #end of method

def city_menu_select
    return $prompt.select("Choose from one of quiz levels", 
    ["Easy", "Medium", "Hard", "Back to the Quiz Menu"]) 

def city_menu
    answer = ""
    while answer != "Back to the Quiz Menu"
        answer = city_menu_select
        case answer
            when "Easy"
                run_test(questions_capital_city_easy)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                sleep(1)
            when "Medium"
                puts "Loading the MEDIUM capital city quiz!"
                run_test(questions_capital_city_medium)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                sleep(1)
            when "Hard"
                puts "Loading the HARD capital city quiz!"
                run_test(questions_capital_city_hard)
                sleep(0.5)
                puts "Saving your score, check out the scores menu to see"
                sleep(1)
                puts "Returning back to the Capital City Quiz Menu..."
                sleep(1)
            when "Back to the Quiz Menu"
                puts "Returning to the quiz menu"
                sleep(0.5)
                puts quiz_menu
                puts " "
        end #end of case statement
    end #end of while loop
end #end of inner method
end # end of outer method

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
        puts " "
        puts "Going to the quiz menu"
        puts " "
        sleep(1)
        quiz_menu_select
    when "Show your Scores"
        puts "Showing your scores"
    when "Exit"
        puts "Exiting from the Quiz App, Goodbye! Please come back!!".yellow
        break
    end # end of the case statement
end # end of while loop