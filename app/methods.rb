def display_hangman(error)
  stages = [  # финальное состояние: голова, торс, обе руки, обе ноги
                '''
                   --------
                   |      |
                   |      O
                   |     \\|/
                   |      |
                   |     / \\
                   -
                ''',
                # голова, торс, обе руки, одна нога
                '''
                   --------
                   |      |
                   |      O
                   |     \\|/
                   |      |
                   |     / 
                   -
                ''',
                # голова, торс, обе руки
                '''
                   --------
                   |      |
                   |      O
                   |     \\|/
                   |      |
                   |      
                   -
                ''',
                # голова, торс и одна рука
                '''
                   --------
                   |      |
                   |      O
                   |     \\|
                   |      |
                   |     
                   -
                ''',
                # голова и торс
                '''
                   --------
                   |      |
                   |      O
                   |      |
                   |      |
                   |     
                   -
                ''',
                # голова
                '''
                   --------
                   |      |
                   |      O
                   |    
                   |      
                   |     
                   -
                ''',
                # начальное состояние
                '''
                   --------
                   |      |
                   |      
                   |    
                   |      
                   |     
                   -
                '''
    ]
    return stages[error]
end


def input_correct
  # Для вывода сообщения о корректности
  # введённых данных.
  
  puts "Введено некорректное значение!"
  puts "Введите верное значение!"
end


def get_letters()
  # Для взятия слова из стандартного потока ввода.
  # И возврата массива из слова.
  
  puts "Назовите слово. Не менее трёх букв."
  puts "Слово не должно содержать пробелов и цифр."
  word = STDIN.gets.encode("UTF-8").chomp
  while not word.eql?("#exit#")
    if (word == nil || word == "" || (word.length < 3 && word.length > 7) || 
        word.count(" ") > 0 || word =~ /\d/)
      input_correct
      word = STDIN.gets.encode("UTF-8").chomp
    else 
      return word.encode("UTF-8").split("")
    end
  end
end


def get_user_input(word)
  # Для запроса букв у пользователя.
  
  puts "Вводите по одной букве."
  litera = STDIN.gets.encode("UTF-8").chomp
  while not word.eql?("#exit#")
    if (word == nil || word == "" || word.length == 1 || 
        word.count(" ") > 0 || word =~ /\d/)
      input_correct
      litera = STDIN.gets.encode("UTF-8").chomp
    else
      return litera
    end
  end
end

@good_letters = []
@bad_letters = []

def check_result(word, word_list)
  # Проверка правильная ли буква
  # и угадано ли слово.
  
  litera = get_user_input(word)
  if (word.include? litera) && (not @good_letters.include? litera)
    @good_letters << litera
    for i in (0...word.length)
      if (word[i].eql? litera)
        word_list[i] = litera
      end
    end
    print(*word_list)
    puts
  elsif (not word.include? litera) && (not @bad_letters.include? litera)
    @bad_letters << litera
    return -1
  elsif (@bad_letters.include? litera) || (@good_letters.include? litera)
    return 0
  end
  if @good_letters.uniq.to_s == word.uniq.to_s
    return 1
  end
end
