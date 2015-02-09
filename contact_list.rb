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

  def command(arg)
    case arg
    when 'help'
      show_help
    end
  end
end

app = Application.new
app.command(ARGV.first)