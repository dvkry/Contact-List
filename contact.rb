class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      
      new_contact = Contact.new(name, email)

      ContactDatabase.new.write_to_file(new_contact) # returns line number witch will also serve as the ID

    end
 
    def find(id)
      # TODO: Will find and return contact by index
      found_contacts = []
      contact_list = ContactDatabase.new.read_from_file
      contact_list.each_with_index do |contact|
        found_contacts << contact if contact.name.downcase.include? id.downcase
      end
      found_contacts
    end
 
    def all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end