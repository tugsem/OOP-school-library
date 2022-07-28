require './student'
require './teacher'
require './book'
require './rental'
require './methods'

class App
  include Methods

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}"
      end
    else
      puts 'List is empty'
    end
    menu
  end

  def list_all_people
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'No people on the list'
    end
    menu
  end

  def create_a_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    int = gets.chomp.to_i
    case int
    when 1
      create_student
    when 2
      create_teacher
    end
    menu
  end

  def create_student
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Has parent permisson? [Y/N]:'
    permission = gets.chomp
    student = Student.new(age, name, permission)
    @people.push(student)
    print 'Person created successfully'
    puts
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    spec = gets.chomp
    teacher = Teacher.new(age, name, spec)
    @people.push(teacher)
    print 'Person created successfully'
    puts
  end

  def create_a_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    print 'Book created successfully'
    puts
    menu
  end

  def create_a_rental
    if @books.length.positive? && @people.length.positive?
      select_book
      book = gets.chomp.to_i
      select_person
      person = gets.chomp.to_i
      puts 'Date:'
      date = gets.chomp
      rental = Rental.new(date, @books[book], @people[person])
      @rentals.push(rental)
      puts 'Rental created successfully'
    else
      puts 'There are no books nor people on the list'
    end
    puts
    menu
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts " #{index}) Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    if @rentals.length.positive?
      puts 'ID of person:'
      id = gets.chomp.to_i
      puts 'Rentals:'
      rented = @rentals.select { |rental| rental.person.id == id }
      puts "Date: #{rented[0].date}, Book \"#{rented[0].book.title}\" by #{rented[0].book.author}"
    else
      puts 'No rentals yet'
    end
    puts
    menu
  end
end