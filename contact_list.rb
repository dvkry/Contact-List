require_relative 'contact'
require_relative 'contact_database'

class Application

  def show_help
    puts "Here is a list of available commands:"
    puts "  new  - Create a new contact"
    puts "  list - List all contacts"
    puts "  show - Show a contact"
    puts "  find - Find a contact"
  end

  def create_new

    print "Name: "
    name = STDIN.gets.chomp
    print "E-mail: "
    email = STDIN.gets.chomp
    
    id = Contact.create(name, email) # ID is the line number
    puts id #return id

  end

  def command(arg)
    case arg
    when 'help'
      show_help
    when 'new'
      id = create_new
    end
  end
end

# TODO read file
app = Application.new
app.command(ARGV.first)