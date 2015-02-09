require_relative 'contact'
require_relative 'contact_database'

def show_help
  puts "Here is a list of available commands:"
  puts "  new  - Create a new contact"
  puts "  list - List all contacts"
  puts "  show - Show a contact"
  puts "  find - Find a contact"
end

case ARGV.first
when 'help'
  show_help
end

