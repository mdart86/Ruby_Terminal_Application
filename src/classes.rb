# MEMBER CLASS START
class Member
    attr_reader :first_name, :last_name, :home_city, :age
    @@member_id = 0
    def initialize(member_details)
        @first_name = member_details[:first_name]
        @last_name = member_details[:last_name]
        @home_city = member_details[:home_city]
        @age = member_details[:age]
        @@member_id += 1
    end
    
    def to_s
        return "Welcome to the Quiz app #{@first_name} from #{@home_city}. Your unique member number is #{@@member_id}. Keep this handy, you'll need it when you come back!"
    end
end
# MEMBER CLASS END

# class Existing_Member
    # attr_reader:
# end

# CAPITAL CITY EASY CLASS START
class Capital_City_Easy
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end
# CAPITAL CITY EASY CLASS END

# CAPITAL CITY MEDIUM CLASS START
class Capital_City_Medium
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end
# CAPITAL CITY MEDIUM CLASS END

# CAPITAL CITY HARD CLASS START
class Capital_City_Hard
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer 
    end
end

# CAPITAL CITY HARD CLASS END