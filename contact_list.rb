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

  def list
    contact_list = ContactDatabase.new.read_from_file

    id_counter = 1

    contact_list.each do |contact|
      puts id_counter.to_s + ": " + contact.name + " (" + contact.email.strip + ")"
      id_counter += 1 # we know that each contact is on it's 'id' line
    end
  end

  def find(id)
    found = Contact.find(id)

    if found != []
      found.each do |contact|
        puts contact.name
        puts contact.email
      end
    else
      puts "Not found"
    end

  end

  def command(arg)
    case arg
    when 'help'
      show_help
    when 'new'
      id = create_new
    when 'list'
      list
    when 'find'
      find(ARGV[1])
    end
  end
end

# TODO read file
app = Application.new
app.command(ARGV.first)