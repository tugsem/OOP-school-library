require './app'

def title
  puts 'Welcome to School Library App!'
end

def main
  title
  app = App.new
  app.menu
end

main
