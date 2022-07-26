require './student'
require './teacher'
require './book'
require './rental'
require './methods'
require 'json'

# rubocop:disable Metrics/ClassLength

class App
  include Methods

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
    load_rentals
  end

  # rubocop:disable Metrics/PerceivedComplexity
  def load_data
    if File.empty?('books.json')
      puts 'List is empty'
    else
      books = JSON.parse(File.read('books.json'))
      books.each do |book|
        @books.push(Book.new(book['Title'], book['Author']))
      end
    end
    if File.empty?('people.json')
      puts 'List is empty'
    else
      people = JSON.parse(File.read('people.json'))
      people.each do |person|
        if person['Class'] == 'Student'
          @people.push(Student.new(person['Age'], person['Name'], person['parent_permission']))
        else
          @people.push(Teacher.new(person['Age'], person['Name'], person['spec']))
        end
      end
    end
  end

  def load_rentals
    if File.empty?('rentals.json')
      puts 'List is empty'
    else
      rentals = JSON.parse(File.read('rentals.json'))
      rentals.each do |rental|
        @rentals.push(Rental.new(rental['date'], @books.select do |book|
                                                   book.title == rental['Book']
                                                 end [0], @people.select do |person|
                                                            person.name == rental['Name']
                                                          end [0]))
      end

    end
  end

  # rubocop:enable Metrics/PerceivedComplexity
  def list_all_books
    if @books.empty?
      puts 'List is empty'
    else
      @books.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}"
      end
    end
    menu
  end

  def list_all_people
    if @people.empty?
      puts 'No people on the list'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
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

  def check_age(age)
    while age < 1
      print 'Please enter a valid age: '
      age = gets.chomp.to_i
    end
  end

  def check_name(name)
    while name == ''
      print 'Pleas enter a valid name: '
      name = gets.chomp.to_s
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    check_age(age)

    print 'Name:'
    name = gets.chomp.to_s
    check_name(name)
    print 'Has parent permisson? [Y/N]:'
    permission = gets.chomp
    student = Student.new(age, name, parent_permission: permission)
    @people.push(student)
    print 'Person created successfully'
    puts
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp.to_i
    check_age(age)

    print 'Name:'
    name = gets.chomp.to_s
    check_name(name)
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
    check_name(title)
    print 'Author:'
    author = gets.chomp
    check_name(author)
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
      @people.each { |person| puts "id: #{person.id}, name: #{person.name}" }
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

  def save_data
    books = []
    people = []
    rentals = []
    @books.each do |book|
      books.push({ Title: book.title, Author: book.author })
    end
    @people.each do |person|
      people.push({ Class: person.class, Name: person.name, Age: person.age })
    end
    @rentals.each do |rent|
      rentals.push({ date: rent.date, Book: rent.book.title, Name: rent.person.name })
    end

    File.write('books.json', JSON.generate(books))
    File.write('people.json', JSON.generate(people))
    File.write('rentals.json', JSON.generate(rentals))
  end
end

# rubocop:enable Metrics/ClassLength
