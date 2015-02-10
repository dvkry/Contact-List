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
      contact_phone_hash = {}
      if contact.length > 2
        phone_nums = contact[2].split('!')
        phone_nums.each do |lable_and_num|
          phone_num = lable_and_num.split(':')
          contact_phone_hash[phone_nums[0]] = phone_nums[1].chomp
        end
      end
      contact_list << Contact.new(contact[0].chomp, contact[1].chomp, contact_phone_hash)
    end
    contact_list
  end

end