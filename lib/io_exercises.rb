# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game(random_num = rand(1..100), count = 1)
  print "GUESS A NUMBER: "
  guess = gets.chomp.to_i
  puts guess

  if guess < random_num
    puts "too low"
    guessing_game(random_num, count += 1)
  elsif guess > random_num
    puts "too high"
    guessing_game(random_num, count += 1)
  else
    puts "#{random_num} IS CORRECT"
    puts "#{count} GUESSES NEEDED"
  end
end

def shuffle_file
  print "Input a file name: "

  file = gets.chomp
  file_lines = []
  file_lines = File.readlines(file)

  shuffled_lines = file_lines.shuffle
  file_name = file.gsub(/.txt/,'')

  line_no = 0
  File.open("#{file_name}--shuffled.txt","w") do |line|
    shuffled_lines.each do |shuffled_line|
      line.puts "#{shuffled_line}"
    end
  end
end
