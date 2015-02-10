## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase



  def write_to_file(contact)
    contactfile = File.open('contacts.csv', 'a')
    contactfile.puts contact.name + ',' + contact.email
    contactfile.close
    id = File.open('contacts.csv').readlines.size # The line number will serve as ID
  end

  def read_from_file
    contact_list = []
    contactfile = File.open('contacts.csv', 'r').readlines.each do |line|
      contact = line.split(',')
      contact_list << Contact.new(contact[0], contact[1])
    end
    contact_list
  end

end