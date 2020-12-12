require 'yaml'

require_relative ("question_answers.rb")
require_relative ("scores.rb")

class InvalidMemberDetails < StandardError
end

def get_details
    member_details = Hash.new{0}
	print "What is your name? "
	member_details[:name] = gets.strip
    print "Where are you from? "
    member_details[:home_city] = gets.strip
    return member_details
end

def validate_details(member_details)
	raise InvalidMemberDetails if(member_details[:name].length == 0 || member_details[:home_city].length == 0)
	return true
end

    # This begin rescue end block ensures that the user enters valid inputs by raising a InvalidMemberDetails error which extends StandardError class.
    # puts member calls the to_s method of the Member class


def create_member
    member_details = get_details
    begin
		validate_details(member_details)
    rescue
        puts "Please complete all details required, we'll keep then safe for you ;)"
        return false
	end
    member = Member.new(member_details)
    puts member
    write_to_file(member_details)
end