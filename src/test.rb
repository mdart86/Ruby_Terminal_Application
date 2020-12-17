# # capital_city_easy [
# #     {Australia: "Canberra",
# #     France: "Paris",
# #     Japan: "Tokyo",
# #     USA: "Washington D.C.",
# #     New_Zealand: "Wellington"
# #     }
# # ]

# puts "What is the capital city of Australia?"
# puts "(A) - Sydney"
# puts "(B) - Canberra"
# puts "(C) - Melbourne"
# print "What do you think it is? "

# answer = gets.chomp.upcase

# if  answer == "A"
#     puts "Unfortunately, that is that is not correct!"
# elsif  answer == "B"
#     score += 1 
#     puts "Correct! Did you know it used to be Melbourne?!"
# elsif answer == "C"
#     puts "Unfortunately, that is that is not correct!"
# else
#     print "Please type A, B or C: "
# end

# # add score to array 
# # score_cc_easy = []

require "bundler"
require "tty-prompt" 
require "colorize"

require 'yaml'
require_relative ("classes.rb")

$prompt = TTY::Prompt.new

def select_option
    return $prompt.select("Choose from one of the following options", 
    ["Create a new profile", "Load an existing profile", "Go to Quiz Menu", "Show your Scores", "Exit"])
end

def quiz_menu
    return $prompt.select("Choose from one of the quiz categories", 
    ["Capital Cities", "Countries", "Geography", "Back to Main Menu"])
end

def city_menu
    return $prompt.select("Choose from one of quiz levels", 
    ["Easy", "Medium", "Hard", "Back to the Quiz Menu"])
end

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
        quiz_menu
            when "Capital Cities"
            puts " "           
            sleep(1)
            city_menu
            puts " "     
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
                sleep(1)
                quiz_menu
        when "Countries"
            puts "Loading the Countries quizzes"
        when "Geography"
            puts "Loading the Geography quizzes" 
        when "Back to Main Menu"
            puts "Going back to the main menu"
            select_option
    when "Show your Scores"
        puts "Showing your scores"
    when "Exit"
        puts "Exiting from the Quiz App, Goodbye! Please come back!!".yellow
        break
    end
end

