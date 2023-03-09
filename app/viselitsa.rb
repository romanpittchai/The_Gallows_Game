load "methods.rb"


def main
  # Основная логика программы.
 
  puts "Игра виселица"
  sleep 1
  word = get_letters
  word_list = ("-" * word.length).split("")
  error = 7
  while error > 0
    result = check_result(word, word_list)
    if result == -1
      error -= 1
      Gem.win_platform? ? (system "cls") : (system "clear")
      puts "Ошибка!"
      puts display_hangman(error)
    elsif result == 0
      puts "Эта буква уже была."
      puts "Введите другую букву."
    elsif result  == 1
      puts "Вы угадали всё слово!"
      break
    end
  end
  puts "Конец игры."
end

main
