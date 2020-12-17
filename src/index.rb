require "bundler"
require "tty-prompt" 
require "colorize"

require 'yaml'
require_relative ("classes.rb")

if ARGV.length > 0
    name = ARGV[0]
else 
    print "What is your first name? "
    name = gets.chomp
end

class InvalidMemberDetails < StandardError
end

def write_to_file(member_details)
    begin
        file = File.open("./data/members.yml","a+"){ |file| file.write(member_details.to_yaml)}
        if file
            puts "Welcome, your details have been saved for next time"
        end
    rescue
        puts "Couldn't locate member"
        puts "Could not save member details to the file"
    end
end

def get_details
    member_details = Hash.new{0}
	print "Please retype your first name: "
	member_details[:first_name] = gets.strip
    print "What is your last name: "
    member_details[:last_name] = gets.strip    
    print "Where are you from?: "
    member_details[:home_city] = gets.strip
    print "What is your age?: "
    member_details[:age] = gets.strip
    return member_details
end

def validate_details(member_details)
	raise InvalidMemberDetails if(member_details[:first_name].length == 0 || member_details[:last_name].length == 0 || member_details[:home_city].length == 0 || member_details[:age].length == 0)
	return true
end

def create_member
    member_details = get_details
    begin
		validate_details(member_details)
    rescue
        puts "Please complete all details required, we'll keep them safe for you ;)"
        return false
	end
    member = Member.new(member_details)
    puts member
    write_to_file(member_details)
end

# def existing_member
#     existing_member = member_details
# end

$prompt = TTY::Prompt.new

# METHODS FOR MENU - START
def main_menu
    input_options_array = ["1","2","3","4","5"]
    puts " "
    puts "Hello, Welcome to the Quiz!"
    puts "First things first, Please choose from the following options : "
    puts "Enter (1) to create a new profile"
    puts "Enter (2) to load your existing profile"
    puts "Enter (3) to go to quiz menu"
    puts "Press (4) to show your answers and score"
    puts "Press (5) to exit"
end

def quiz_menu
    input_options_array_quiz = ["1","2","3","4","5"]
    puts " "
    puts "You are now in the quiz menu! Please select your quiz"
    puts "Enter (1) To Look at the Capital City Quizzes"
    puts "Enter (2) To Look at the Countries Quizzes"
    puts "Enter (3) To Look at the Geography Quizzes"
    puts "Enter (4) to go to the Scores Menu"
    puts "Enter (5) to Back to Main Menu"
end

def capital_city_menu
    input_options_array_capital_city = ["1","2","3","4","5"]
    puts " "
    puts "You are now in the Capital City menu! Please select your quiz"
    puts "Enter (1) to try the EASY quiz"
    puts "Enter (2) to try the MEDIUM quiz"
    puts "Enter (3) to try the HARD quiz"
    puts "Press (4) to go back to the Quiz Menu"
end

def score_menu
    input_options_array_quiz = ["1","2","3","4"]
    puts " "
    puts "You are now in the quiz menu! Please select your quiz"
    puts "Enter (1) to show your Capital Cities Quiz scores"
    puts "Enter (2) to show your Countries Quiz scores"
    puts "Enter (3) to show your Geography Quiz scores"
    puts "Press (4) to Back to Main Menu"
end
# METHODS FOR MENU - END

# CAPITAL CITY EASY QUESTIONS AND ANSWERS - START
    p1 = "What is the capital city of Australia?\n(A) Sydney\n(B) Canberra\n(C) Melbourne"
    p2 = "What is the capital city of France?\n(A) Nice\n(B) Lyon\n(C) Paris"
    p3 = "What is the capital city of Japan?\n(A) Tokyo\n(B) Osaka\n(C) Nagoya"
    p4 = "What is the capital city of the USA?\n(A) New York City\n(B) Washington D.C.\n(C) Los Angeles"
    p5 = "What is the capital city of New Zealand?\n(A) Auckland\n(B) Christchurch\n(C) Wellington"
    
    questions_capital_city_easy = [
        Capital_City_Easy.new(p1, "B"),
        Capital_City_Easy.new(p2, "C"),
        Capital_City_Easy.new(p3, "A"),
        Capital_City_Easy.new(p4, "B"),
        Capital_City_Easy.new(p5, "C")
    ]
# CAPITAL CITY EASY QUESTIONS AND ANSWERS - END

# CAPITAL CITY MEDIUM QUESTIONS AND ANSWERS - START
p1 = "What is the capital city of Italy?\n(A) Milan\n(B) Rome\n(C) Venice"
p2 = "What is the capital city of China?\n(A) Shanghai\n(B) Beijing\n(C) Hong Kong"
p3 = "What is the capital city of Canada?\n(A) Vancouver\n(B) Toronto\n(C) Ottawa"
p4 = "What is the capital city of Malta?\n(A) Sliema\n(B) Valletta\n(C) Mdina"
p5 = "What is the capital city of Thailand?\n(A) Phuket\n(B) Chiang Mai\n(C) Bangkok"

    questions_capital_city_medium = [
        Capital_City_Medium.new(p1, "B"),
        Capital_City_Medium.new(p2, "B"),
        Capital_City_Medium.new(p3, "C"),
        Capital_City_Medium.new(p4, "B"),
        Capital_City_Medium.new(p5, "C")
    ]   
# CAPITAL CITY MEDIUM QUESTIONS AND ANSWERS - END

# CAPITAL CITY HARD QUESTIONS AND ANSWERS - START
p1 = "What is the capital city of Turkey?\n(A) Istanbul\n(B) Ankara\n(C) Alanya"
p2 = "What is the capital city of Brazil?\n(A) Sao Paulo\n(B) Brasilia\n(C) Rio De Janeiro"
p3 = "What is the capital city of Switzerland?\n(A) Bern\n(B) Geneva\n(C) Zurich"
p4 = "What is the capital city of Morocco?\n(A) Rabat\n(B) Casablanca\n(C) Marrakesh"
p5 = "What is the capital city of Colombia?\n(A) Cali\n(B) Medellin\n(C) Bogota"

questions_capital_city_hard = [
    Capital_City_Hard.new(p1, "B"),
    Capital_City_Hard.new(p2, "B"),
    Capital_City_Hard.new(p3, "A"),
    Capital_City_Hard.new(p4, "A"),
    Capital_City_Hard.new(p5, "C")
]
# CAPITAL CITY HARD QUESTIONS AND ANSWERS - END

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
                puts "You have answered correctly!"
            else
                puts "Better luck next time!"
            end
            puts " "
        end
        puts "You got" " " + score.to_s + "/" + questions_capital.length().to_s
    end


while true
    input_options_array = ["1","2","3","4","5"]
    puts " "
    puts "Hello #{name}, Welcome to the Quiz App, one moment please...!"
    sleep(0.5)
    puts " "
    puts "Enter (1) to create a new profile"
    puts "Enter (2) to load your existing profile"
    puts "Enter (3) to go to quiz menu"
    puts "Press (4) to show your answers and score"
    puts "Press (5) to exit"
    print "Please choose from one of the above options: "
    input_option = gets.strip 
    # This is the simplest form of error handling using an if statement where we are not explicitly using any begin-rescue-end block
    if !input_options_array.include?(input_option)
        puts "Expecting an input of: 1,2,3,4 OR 5"
        next
    end
    case input_option
        when "1"
            puts "Let's get started and create a new profile for you!"
            sleep(1)
            create_member     
        when "2"
            # Invoke a method called existing_member
            puts "Loading your profile..."
            # existing_member
        when "3"
            puts "Going to the quiz menu"
            sleep(1)
            while true
                input_options_array_quiz = ["1","2","3","4", "5"]
                puts " "
                puts "You are now in the quiz menu! Please select your quiz"
                puts "Enter (1) To Look at the Capital City Quizzes"
                puts "Enter (2) To Look at the Countries Quizzes"
                puts "Enter (3) To Look at the Geography Quizzes"
                puts "Enter (4) to go to the Scores Menu"
                puts "Enter (5) to Back to Main Menu"
                input_option = gets.strip
                if !input_options_array_quiz.include?(input_option)
                    puts "Expecting an input of: 1,2,3 OR 4"
                    next
                end
                case input_option
                when "1"
                    puts "Loading the Capital City Quizzes"
                    sleep(1)
                        while true
                            input_options_array_capital_city = ["1","2","3","4"]
                            puts " "
                            puts "Welcome to the Capital City Quiz Menu! Please select the quiz level you want to do"
                            puts "Enter (1) to try the EASY quiz"
                            puts "Enter (2) to try the MEDIUM quiz"
                            puts "Enter (3) to try the HARD quiz"
                            puts "Press (4) to go back to the Quiz Menu"
                            input_option = gets.strip
                            if !input_options_array_capital_city.include?(input_option)
                                puts "Expecting an input of: 1,2,3 OR 4"
                                next
                            end
                        case input_option
                        when "1"
                            puts "Loading the EASY capital city quiz!"
                            run_test(questions_capital_city_easy)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see"
                            sleep(1)
                            puts "Returning back to the Capital City Quiz Menu..."
                            sleep(1)
                        when "2"
                            puts "Loading the MEDIUM capital city quiz!"
                            run_test(questions_capital_city_medium)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see"
                            sleep(1)
                            puts "Returning back to the Capital City Quiz Menu..."
                            sleep(1)
                        when "3"
                            puts "Loading the HARD capital city quiz!"
                            run_test(questions_capital_city_hard)
                            sleep(0.5)
                            puts "Saving your score, check out the scores menu to see"
                            sleep(1)
                            puts "Returning back to the Capital City Quiz Menu..."
                            sleep(1)
                        when "4"
                            puts "Returning to the quiz menu"
                            sleep(1)
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
                    puts "Going to the scores menu"
                    sleep(1)
                    score_menu
                when "5"
                    puts "Going back to main menu"
                    main_menu
                break
                end # end of case statement
            end # End of while loop
        when "4"
            puts "Loading the score menu"
            sleep(1)
                while true
                input_options_array_quiz = ["1","2","3","4"]
                puts " "
                puts "You are now in the quiz menu! Please select your quiz"
                puts "Enter (1) to show your Capital Cities Quiz scores"
                puts "Enter (2) to show your Countries Quiz scores"
                puts "Enter (3) to show your Geography Quiz scores"
                puts "Press (4) to Back to Main Menu"
                input_option = gets.strip 
                if !input_options_array.include?(input_option)
                    puts "Expecting an input of: 1,2,3,4 OR 5"
                    next
                end
                case input_option
                    when "1"
                        puts "Loading Capital City Quiz Scores"
                        sleep(1)
                        puts "Your score for the EASY quiz is: " + $score_cc_easy.length + "/ 5" 
                        # puts "Your score for the MEDIUM quiz is: " $score_cc_medium "/ 5"   
                        # puts "Your score for the HARD quiz is: " $score_cc_hard "/ 5" 
                        if input_option == "4"
                            main_menu
                        end
                    when "2"
                        puts "Loading Countries Quiz Scores"   
                    when "3"
                        puts "Loading Geography Quiz Scores"   
                    when "4"
                    puts "Going back to main menu"
                    main_menu
                break
                end # end of case statement
            end # End of while loop
        when "5"
            puts "Exiting from the Quiz App ..."
            break
        else
            puts "Please choose from the options 1,2,3,4 OR 5"
            next
    end # end of case statement
end # End of while loop