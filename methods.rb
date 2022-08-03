require './app'

module Methods
  def menu
    puts
    puts 'Please select an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_input
  end

  def user_input
    input = gets.chomp
    input_is_valid?(input)
  end

  def input_is_valid?(input)
    if %w[1 2 3 4 5 6 7].include?(input)
      selected_option input
    else
      puts "#{input} isn't in the list! Try again"
      menu
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def selected_option(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_rentals
    when '7'
      save_data
      puts 'Thank you for using this app!'
      exit
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
