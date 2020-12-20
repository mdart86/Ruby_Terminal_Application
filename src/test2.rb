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

def city_menu_select
    return $prompt.select("Choose from one of quiz levels", 
    ["Easy", "Medium", "Hard", "Back to the Quiz Menu"]) 
end
