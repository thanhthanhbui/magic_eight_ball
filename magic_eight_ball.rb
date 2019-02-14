require "colorize"

class Magic_eight_ball
  def initialize
   @arr = ["It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"]
    @answer_arr = @arr.clone
     puts "Welcome to the Magic Eight Ball!".colorize(:red)
    menu
  end

  def menu
    puts "1) Type a question to get an answer.".colorize(:green)
    puts "2) Exit.".colorize(:green)
    choice = gets.to_i
    case choice
      when 1
        puts "Type a question to get an answer.".colorize(:green)
        choice2 = gets.strip
        choice2 == "Change" ? answer_options : answer
      when 2
        puts "Thanks for using the Magic Eigth Ball!".colorize(:red)
        sleep(2)
        print `clear`
        exit
      else
        puts "Invalid choice. Try again.".colorize(:red)
        menu    
    end
  end

  def answer_options
    puts "1) Add your own answer.".colorize(:blue)
    puts "2) Reset the answer.".colorize(:blue)
    puts "3) Print all answers.".colorize(:blue)
    puts "4) Done".colorize(:blue)
    choice = gets.to_i
    case choice
      when 1
        add_answer
      when 2
        reset_answer
      when 3
        print_answers
      when 4
        menu
      else
        puts "Invalid choice. Try again.".colorize(:red)
        menu  
    end
  end

  def add_answer
    puts "Enter your new answer: ".colorize(:green)
    @input = gets.downcase.strip
    @downcase_arr = @answer_arr.map(&:downcase)
    if @downcase_arr.include? @input
      puts "Answer already exists.".colorize(:red)
      sleep(1)
      answer_options
    else
      @answer_arr << @input.capitalize
      testput = @input.capitalize
      puts "New answer added.".colorize(:red)
      sleep(1)
      answer_options
    end
  end

  def reset_answer
    @answer_arr = @arr.clone
    puts "Answers reset.".colorize(:red)
    answer_options
  end

  def print_answers
    puts @answer_arr
    answer_options
  end

  def answer
    puts @answer_arr.sample
  end

end

magic_eight_ball = Magic_eight_ball.new
magic_eight_ball