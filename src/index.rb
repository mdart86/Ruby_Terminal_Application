# ACCESS CODE - START
require "bundler"
require "tty-prompt" 
require "colorize"
require "tty-font"
require 'lolize'

require 'yaml'
require_relative ("classes.rb")

$prompt = TTY::Prompt.new
colorizer = Lolize::Colorizer.new
font = TTY::Font.new(:doom)

# ACCESS CODE - END

# COMMAND LINE ARGV START
if ARGV.length > 0
    name = ARGV[0]
else 
    print "What is your first name? "
    name = gets.chomp
end
# COMMAND LINE ARGV END

puts "Hello #{name}, you're in!! Loading a menu...!".colorize(:blue)
sleep(1)
system("clear")

class InvalidMemberDetails < StandardError
end

# MEMBER DETAILS METHODS - START
def write_to_file(member_details)
    begin
        file = File.open("./data/members.yml","a+"){ |file| file.write(member_details.to_yaml)}
        if file
            puts "Welcome, your details have been saved for next time".colorize(:green)
        end
    rescue
        puts "Couldn't locate member".colorize(:red)
        puts "Could not save member details to the file".colorize(:red)
    end
end

def get_details
    # controlled by a member class, to gather details of the user
    member_details = Hash.new{0}
	print "Please retype your first name "
	member_details[:first_name] = gets.strip 
    print "What is your last name? "
    member_details[:last_name] = gets.strip    
    print "Where are you from? "
    member_details[:home_city] = gets.strip
    print "How young are you? "
    member_details[:age] = gets.strip
    return member_details
end

def validate_details(member_details)
    # Member details are validated by this function
	raise InvalidMemberDetails if(member_details[:first_name].length == 0 || member_details[:last_name].length == 0 || member_details[:home_city].length == 0 || member_details[:age].length == 0)
	return true
end

def create_member
    # this method creates the member based on what details are entered
    member_details = get_details
    # error handling to ensure member details provided match what is required, if not the user is advised
    begin
		validate_details(member_details)
    rescue
        puts "Please complete all details required, we'll keep them safe for you ;)".colorize(:red)
        get_details
        return false
	end
    member = Member.new(member_details)
    puts member
    write_to_file(member_details) # member details written to yaml file
end
# MEMBER DETAILS METHODS - END

# def existing_member
#     existing_member = member_details
# end

# METHODS FOR MENU - START
def main_menu
    input_options_array = ["1","2","3","4","5"]
end

def quiz_menu
    input_options_array_quiz = ["1","2","3","4","5"]
end

def capital_city_menu
    input_options_array_capital_city = ["1","2","3","4","5"]
end

def score_menu
    input_options_array_score = ["1","2","3","4"]
end
# METHODS FOR MENU - END

# CAPITAL CITY EASY QUESTIONS AND ANSWERS - START
    p1 = "What is the capital city of Australia?\n(A) Sydney\n(B) Canberra\n(C) Melbourne"
    p2 = "What is the capital city of France?\n(A) Nice\n(B) Lyon\n(C) Paris"
    p3 = "What is the capital city of Japan?\n(A) Tokyo\n(B) Osaka\n(C) Nagoya"
    p4 = "What is the capital city of the USA?\n(A) New York City\n(B) Washington D.C.\n(C) Los Angeles"
    p5 = "What is the capital city of New Zealand?\n(A) Auckland\n(B) Christchurch\n(C) Wellington"

# QUESTIONS ARRAY WITH OBJECTS FOR EASY - START
questions_capital_city_easy = [
        Capital_City_Easy.new(p1, "B"),
        Capital_City_Easy.new(p2, "C"),
        Capital_City_Easy.new(p3, "A"),
        Capital_City_Easy.new(p4, "B"),
        Capital_City_Easy.new(p5, "C")
    ]
# QUESTIONS ARRAY WITH OBJECTS FOR EASY - END
# CAPITAL CITY EASY QUESTIONS AND ANSWERS - END

# CAPITAL CITY MEDIUM QUESTIONS AND ANSWERS - START
p1 = "What is the capital city of Italy?\n(A) Milan\n(B) Rome\n(C) Venice"
p2 = "What is the capital city of China?\n(A) Shanghai\n(B) Beijing\n(C) Hong Kong"
p3 = "What is the capital city of Canada?\n(A) Vancouver\n(B) Toronto\n(C) Ottawa"
p4 = "What is the capital city of Malta?\n(A) Sliema\n(B) Valletta\n(C) Mdina"
p5 = "What is the capital city of Thailand?\n(A) Phuket\n(B) Chiang Mai\n(C) Bangkok"

# QUESTIONS ARRAY WITH OBJECTS FOR MEDIUM - START
    questions_capital_city_medium = [
        Capital_City_Medium.new(p1, "B"),
        Capital_City_Medium.new(p2, "B"),
        Capital_City_Medium.new(p3, "C"),
        Capital_City_Medium.new(p4, "B"),
        Capital_City_Medium.new(p5, "C")
    ]   
# QUESTIONS ARRAY WITH OBJECTS FOR MEDIUM - END
# CAPITAL CITY MEDIUM QUESTIONS AND ANSWERS - END

# CAPITAL CITY HARD QUESTIONS AND ANSWERS - START
p1 = "What is the capital city of Turkey?\n(A) Istanbul\n(B) Ankara\n(C) Alanya"
p2 = "What is the capital city of Brazil?\n(A) Sao Paulo\n(B) Brasilia\n(C) Rio De Janeiro"
p3 = "What is the capital city of Switzerland?\n(A) Bern\n(B) Geneva\n(C) Zurich"
p4 = "What is the capital city of Morocco?\n(A) Rabat\n(B) Casablanca\n(C) Marrakesh"
p5 = "What is the capital city of Colombia?\n(A) Cali\n(B) Medellin\n(C) Bogota"

# QUESTIONS ARRAY WITH OBJECTS FOR HARD - START
questions_capital_city_hard = [
    Capital_City_Hard.new(p1, "B"),
    Capital_City_Hard.new(p2, "B"),
    Capital_City_Hard.new(p3, "A"),
    Capital_City_Hard.new(p4, "A"),
    Capital_City_Hard.new(p5, "C")
]
# QUESTIONS ARRAY WITH OBJECTS FOR HARD - END
# CAPITAL CITY HARD QUESTIONS AND ANSWERS - END

# QUIZ METHOD - START
    def run_test(questions_capital)
        answer = ""
        score = 0
        for question in questions_capital
            puts question.prompt
            answer = gets.chomp.upcase
            puts " "
            puts "You've answered: #{answer}"
            puts "The correct answer is: #{question.answer}"
            if answer == question.answer
                score += 1
                puts "You have answered correctly!".green
            else
                puts "Better luck next time!".red
            end
            puts " "
        end
        puts "You got" " " + score.to_s + "/" + questions_capital.length().to_s
    end
# QUIZ METHOD - END
    

puts font.write("QUIZ APP", letter_spacing: 3)

while true
    input_options_array = ["1","2","3","4","5"]
    puts "Enter (1) to create a new profile".colorize(:red)
    puts "Enter (2) to load your existing profile".colorize(:light_red)
    puts "Enter (3) to go to quiz menu".colorize(:yellow)
    puts "Press (4) to show your answers and score".colorize(:blue)
    puts "Press (5) to exit".colorize(:magenta)
    print "Please choose from one of the above options: ".colorize(:green)
    input_option = gets.strip 
    # This is the simplest form of error handling using an if statement where we are not explicitly using any begin-rescue-end block
    if !input_options_array.include?(input_option)
        puts "Expecting an input of: 1, 2, 3, 4 OR 5".colorize(:red)
        next
    end
    case input_option
        when "1"
            sleep(1)
            system("clear")
            puts font.write("TIME TO CREATE").colorize(:yellow)
            puts "#{name}, please answer a few questions for us to get to know you better ;)!".colorize(:blue)
            create_member     
        when "2"
            puts "PLEASE NOTE THIS AREA IS UNDERCONSTRUCTION".upcase.colorize(:red)
            sleep(1.0)
            puts "Loading your profile..."
            # existing_member
        when "3"
            puts "Yay #{name}! You're going to the quiz menu".upcase.colorize(:red)
            sleep(1)
            system("clear")
            while true
                input_options_array_quiz = ["1","2","3","4", "5"]
                puts font.write("QUIZ MENU").colorize(:magenta)
                puts "Enter (1) To Look at the Capital City Quizzes".colorize(:red)
                puts "Enter (2) To Look at the Countries Quizzes".colorize(:light_red)
                puts "Enter (3) To Look at the Geography Quizzes".colorize(:yellow)
                puts "Enter (4) to go to the Scores Menu".colorize(:blue)
                puts "Enter (5) to Back to Main Menu".colorize(:magenta)
                print "You are now in the quiz menu! Please select your quiz category: ".colorize(:green)
                input_option = gets.strip
                if !input_options_array_quiz.include?(input_option)
                    puts "Expecting an input of: 1, 2, 3, 4 OR 5".colorize(:red)
                    next
                end
                case input_option
                when "1"
                    puts "Loading the Capital City Quizzes, we will be right with you #{name}".upcase.colorize(:red)
                    sleep(1)
                    system("clear")
                        while true
                            input_options_array_capital_city = ["1","2","3","4"]
                            puts font.write("CAPITAL CITY QUIZZES").colorize(:magenta)
                            puts "Enter (1) to try the EASY quiz".colorize(:red)
                            puts "Enter (2) to try the MEDIUM quiz".colorize(:light_red)
                            puts "Enter (3) to try the HARD quiz".colorize(:yellow)
                            puts "Press (4) to go back to the Quiz Menu".colorize(:magenta)
                            print "Please select the quiz level you want to take: ".colorize(:green)
                            input_option = gets.strip
                            if !input_options_array_capital_city.include?(input_option)
                                puts "Expecting an input of: 1, 2, 3 OR 4".colorize(:red)
                                next
                            end
                        case input_option
                        when "1"
                            puts "Loading the EASY capital city quiz! Sometimes, #{name} it's great to start at the easiest level!".upcase.colorize(:red)
                            run_test(questions_capital_city_easy)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see".upcase.colorize(:red)
                            sleep(1)
                            puts " "
                            puts "Returning back to the Capital City Quiz Menu now #{name}! One moment...".upcase.colorize(:red)
                            sleep(1)
                            system("clear")
                        when "2"
                            puts "Time try a more callenging quiz #{name}! Loading the MEDIUM capital city quiz!".upcase.colorize(:red)
                            run_test(questions_capital_city_medium)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see".upcase.colorize(:red)
                            sleep(1)
                            puts " "
                            puts "Returning back to the Capital City Quiz Menu now #{name}! One moment...".upcase.colorize(:red)
                            sleep(1)
                            system("clear")
                        when "3"
                            puts "Alright! Let's go for it! Good luck #{name}! Loading the HARD capital city quiz!".upcase.colorize(:red)
                            run_test(questions_capital_city_hard)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see"
                            sleep(1)
                            puts " "
                            puts "Returning back to the Capital City Quiz Menu now #{name}! One moment...".upcase.colorize(:red)
                            sleep(1)
                            system("clear")
                        when "4"
                            puts "Well done for trying out these quizzes #{name}! Returning to the quiz menu".upcase.colorize(:red)
                            sleep(1)
                            system("clear")
                            quiz_menu
                        break
                        end # end of case statement
                    end # End of while loop
                when "2"
                    puts "Undefined option"  
                    # add code to option 
                when "3"
                    puts "Undefined option"   
                    # add code to option 
                when "4"
                    puts "Going to the scores menu".upcase.colorize(:red)
                    sleep(1)
                    system("clear")
                    score_menu
                when "5"
                    puts "Going back to main menu".upcase.colorize(:red)
                    sleep(1)
                    system("clear")
                    puts font.write("MAIN MENU").colorize(:magenta)
                    main_menu
                break
                end # end of case statement
            end # End of while loop
        when "4"
            puts "Loading the score menu".upcase.colorize(:red)
            sleep(1)
            system("clear")
                while true
                input_options_array_score = ["1","2","3","4"]
                puts "PLEASE NOTE THIS AREA IS UNDERCONSTRUCTION".upcase.colorize(:red)
                puts "Enter (1) to show your Capital Cities Quiz scores"
                puts "Enter (2) to show your Countries Quiz scores"
                puts "Enter (3) to show your Geography Quiz scores"
                puts "Press (4) to Back to Main Menu"
                print "So #{name}, you've completed some quizzes, why don't you see how well you've done! ".colorize(:green)
                input_option = gets.strip 
                if !input_options_array_score.include?(input_option)
                    puts "Expecting an input of: 1,2,3 OR 4".colorize(:red)
                    next
                end
                case input_option
                    when "1"
                        puts "Loading Capital City Quiz Scores"
                        sleep(1)
                        puts "Your score for the EASY quiz is: " + $score_cc_easy.length + "/ 5" 
                        if input_option == "4"
                            main_menu
                        end
                    when "2"
                        puts "Loading Countries Quiz Scores"   
                    when "3"
                        puts "Loading Geography Quiz Scores"   
                    when "4"
                    puts "Going back to main menu"
                    sleep(1)
                    system("clear")
                    main_menu
                break
                end # end of case statement
            end # End of while loop
        when "5"
            colorizer.write "Exiting from the Quiz App, Goodbye! Please come back!!\n"
            sleep(1)
            system("clear")
            break
        else
            puts "Please choose from the options 1,2,3,4 OR 5".colorize(:red)
            next
    end # end of case statement
end # End of while loop


# TO LIST
# Acces member on return to App


# Add extra quizes - look at making an array of hashes
# create a score menu 

# FIX TTY PROMPT
# Update if quiz is retaken

# DONE LIST
# Sleep after each input

# Put correct or incorrect when user gives answer
