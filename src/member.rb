class Member
    attr_reader :name, :home_city
    @@member_id = 0
    def initialize(member_details)
        @name = member_details[:name]
        @home_city = member_details[:home_city]
        @@member_id += 1
    end

    def to_s
        return "Welcome to the Library App #{@name} #{@home_city}. Your unique member number is #{@@member_id}. Keep this handy, you'll need it when you come back!"
    end
end