load "methods.rb"


def main
  # Основная логика программы.
 
  puts "Игра виселица"
  sleep 1
  word = get_letters
  error = 0
  while error < 8
    result = check_result(word)
    if result == -1
      error += 1
    elsif result == 0
      puts "Эта буква уже была."
      puts "Введите другую букву."
    else
      puts "Вы угадали всё слово!"
      break
    end
  end
  puts "Конец игры."
end

main
