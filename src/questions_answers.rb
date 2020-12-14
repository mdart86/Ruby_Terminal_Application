require_relative ("./classes.rb")

# CAPITAL CITY EASY QUESTIONS ANSWER AND METHOD START
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

    def run_test(questions_capital_city_easy)
        answer = ""
        score = 0
        for question in questions_capital_city_easy
            puts question.prompt
            answer = gets.chomp()
            if answer.upcase! == question.answer
                score += 1
            end
        end
        puts "You got" " " + score.to_s + "/" + questions_capital_city_easy.length().to_s
    end
# CAPITAL CITY EASY QUESTIONS ANSWER AND METHOD START

# CAPITAL CITY MEDIUM QUESTIONS ANSWER AND METHOD START
p1 = "What is the capital city of Italy?\n(A) Milan\n(B) Rome\n(C) Venice"
p2 = "What is the capital city of China?\n(A) Shanghai\n(B) Beijing\n(C) Hong Kong"
p3 = "What is the capital city of Canada?\n(A) Vancouver\n(B) Toronto\n(C) Ottawa"
p4 = "What is the capital city of Malta?\n(A) Sliema\n(B) Valletta\n(C) Mdina"
p5 = "What is the capital city of Thailand?\n(A) Phuket\n(B) Chiang Mai\n(C) Bangkok"

questions_capital_city_medium = [
    Capital_City_Easy.new(p1, "B"),
    Capital_City_Easy.new(p2, "B"),
    Capital_City_Easy.new(p3, "C"),
    Capital_City_Easy.new(p4, "B"),
    Capital_City_Easy.new(p5, "C")
]

    def run_test(questions_capital_city_medium)
        answer = ""
        score = 0
        for question in questions_capital_city_medium
            puts question.prompt
            answer = gets.chomp()
            if answer.upcase! == question.answer
                score += 1
            end
        end
        puts "You got" " " + score.to_s + "/" + questions_capital_city_medium.length().to_s
    end
# CAPITAL CITY MEDIUM QUESTIONS ANSWER AND METHOD END

# CAPITAL CITY HARD QUESTIONS ANSWER AND METHOD START
p1 = "What is the capital city of Turkey?\n(A) Istanbul\n(B) Ankara\n(C) Alanya"
p2 = "What is the capital city of Brazil?\n(A) Sao Paulo\n(B) Brasilia\n(C) Rio De Janeiro"
p3 = "What is the capital city of Switzerland?\n(A) Bern\n(B) Geneva\n(C) Zurich"
p4 = "What is the capital city of Morocco?\n(A) Rabat\n(B) Casablanca\n(C) Marrakesh"
p5 = "What is the capital city of Colombia?\n(A) Cali\n(B) Medellin\n(C) Bogota"

questions_capital_city_hard = [
    Capital_City_Easy.new(p1, "B"),
    Capital_City_Easy.new(p2, "B"),
    Capital_City_Easy.new(p3, "A"),
    Capital_City_Easy.new(p4, "A"),
    Capital_City_Easy.new(p5, "C")
]

    def run_test(questions_capital_city_hard)
        answer = ""
        score = 0
        for question in questions_capital_city_hard
            puts question.prompt
            answer = gets.chomp()
            if answer.upcase! == question.answer
                score += 1
            end
        end
        puts "You got" " " + score.to_s + "/" + questions_capital_city_hard.length().to_s
    end
# CAPITAL CITY HARD QUESTIONS ANSWER AND METHOD END