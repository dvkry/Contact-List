## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase



  def write_to_file(contact)
    contactfile = File.open('contacts.csv', 'a')
    contactfile.puts contact.name + ',' + contact.email
    contactfile.close
    id = File.open('contacts.csv').readlines.size # The line number will serve as ID
  end

end