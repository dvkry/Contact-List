require_relative 'contact'
require_relative 'contact_database'
require 'pry'
require 'io/console'

class Application
  def command(arg)
    case arg
    when 'help'
      Help.run
    when 'new'
      id = CreateNew.run
    when 'list'
      List.run
    when 'find'
      Find.run(ARGV[1])
    end
  end
end

class Help
  def self.run
    puts "Here is a list of available commands:"
    puts "  new  - Create a new contact"
    puts "  list - List all contacts"
    puts "  show - Show a contact"
    puts "  find - Find a contact"
  end
end

class CreateNew
  def self.run
    print "E-mail: "
    email = STDIN.gets.chomp
    if Contact.dups_by_email(email)
      puts "That E-mail already exists"
    else
      print "Name: "
      name = STDIN.gets.chomp
      print "Would you like to add the phone numbers?"
      response = STDIN.gets.chomp.downcase
      phone_hash = {}
      while response == 'yes'
        print "Lable: "
        lable = STDIN.gets.chomp
        print "Number: "
        number = STDIN.gets.chomp
        phone_hash[lable] = number
        print "add another number? "
        response = STDIN.gets.chomp.downcase
      end
      id = Contact.create(name, email, phone_hash) # ID is the line number
      puts id #return id
    end
  end
end

class List
  def self.wait_for_key
    print "any key to continue"
    STDIN.getch
  end
  def self.run
    contact_list = ContactDatabase.new.read_from_file
    id_counter = 1
    contact_list.each do |contact|
      puts id_counter.to_s + ": " + contact.name + " (" + contact.email.strip + ")"
      puts contact.phone_nums if contact.phone_nums != {}
      id_counter += 1 # we know that each contact is on it's 'id' line
      wait_for_key if (id_counter - 1) % 5 == 0
    end
  end
end

class Find
  def self.run(id)
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
end

app = Application.new
app.command(ARGV.first)