require 'yaml'
require_relative ("./questions_answers.rb")
require_relative ("./classes.rb")

class InvalidMemberDetails < StandardError
end

def write_to_file(member_details)
    begin
        file = File.open("../data/members.yml","a+"){ |file| file.write(member_details.to_yaml)}
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
	print "What is your first name: "
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

def main_menu
    input_options_array = ["1","2","3","4","5"]
    puts "Hello, Welcome to the Quiz!"
    puts "First things first, Please choose from the following options : "
    puts "Enter (1) to create a new profile"
    puts "Enter (2) to load your existing profile"
    puts "Enter (3) to go to quiz menu"
    puts "Press (4) to show your answers and score"
    puts "Press (5) to exit"
end

def quiz_menu
    input_options_array_quiz = ["1","2","3","4"]
    puts "You are now in the quiz menu! Please select your quiz"
    puts "Enter (1) To Look at the Capital City Quizzes"
    puts "Enter (2) To Look at the Countries Quizzes"
    puts "Enter (3) To Look at the Geography Quizzes"
    puts "Press (4) to Back to Main Menu"
end

def capital_city_menu
    input_options_array_capital_city = ["1","2","3","4","5"]
    puts "You are now in the Capital City menu! Please select your quiz"
    puts "Enter (1) to try the EASY capital city Quiz"
    puts "Enter (1) to try the MEDIUM capital city Quiz"
    puts "Enter (1) to try the HARD capital city Quiz"
    puts "Press (4) to go back to the Quiz Menu"
end

while true
    input_options_array = ["1","2","3","4","5"]
    puts "Hello, Welcome to the Quiz!"
    puts "First things first, Please choose from the following options : "
    puts "Enter (1) to create a new profile"
    puts "Enter (2) to load your existing profile"
    puts "Enter (3) to go to quiz menu"
    puts "Press (4) to show your answers and score"
    puts "Press (5) to exit"
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
                input_options_array_quiz = ["1","2","3","4"]
                puts "You are now in the quiz menu! Please select your quiz"
                puts "Enter (1) To Look at the Capital City Quizzes"
                puts "Enter (2) To Look at the Countries Quizzes"
                puts "Enter (3) To Look at the Geography Quizzes"
                puts "Press (4) to Back to Main Menu"
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
                            puts "Welcome to the Capital City Quiz Menu! Please select the quiz level you want to do"
                            puts "Enter (1) to try the EASY capital city Quiz"
                            puts "Enter (1) to try the MEDIUM capital city Quiz"
                            puts "Enter (1) to try the HARD capital city Quiz"
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
                            # figure out why I can't use methods across pages
                        when "2"
                            puts "Loading the MEDIUM capital city quiz!"
                            run_test(questions_capital_city_medium)
                            # figure out why I can't use methods across pages
                        when "3"
                            puts "Loading the HARD capital city quiz!"
                            run_test(questions_capital_city_hard)
                            # figure out why I can't use methods across pages
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
                    puts "Going back to main menu"
                    main_menu
                break
                end # end of case statement
            end # End of while loop
        when "4"
            puts "Showing your answers and score"
        when "5"
            puts "Exiting from the Quiz App ..."
            break
        else
            puts "Please choose from the options 1,2,3,4 OR 5"
            next
    end # end of case statement
end # End of while loop