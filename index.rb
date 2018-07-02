require 'pry'
require 'httparty'
require 'colorize'


class BrainTeaser
  include HTTParty
  base_uri 'http://json-server.devpointlabs.com/api/v1/users'
  
  def initialize(users, page)
    @users = { query: { site: users } }
  end

  def menu 
    puts `clear`
    puts "Make a selection:"
    puts "1: List all users"
    puts "2: List a single user"
    puts "3: Add a user" 
    puts "4: Edit a user" 
    puts "5. Delete a user"

    input = gets.strip.to_i 
    selection 
  end

  def selection(input)
    if ( input == 1 )
      listUsers
    elsif ( input == 2 )
      singleUser
    elsif ( input == 3 )
      addUser
    elsif ( input == 4 )
      editUser
    elsif ( input == 5 )
      deleteUser
    else 
      puts "Invalid, try again"
      menu
    end
  end
  
  def listUsers
    puts "Here are all the users"
    # list = self.class.get("/", @users)
    # puts list
  #   list.each do 
  #     { |u| print list[u].values_at("first_name") }
  #   end
  # binding.pry
  end

  def singleUser
    puts "Insert a user id"
    # id = gets.strip.to_i
    # single = self.class.get("/#{id}", @users)
    # puts single
  end

  def addUser
    puts "Add a user"
    # amke an axios post call to a single id
  end

  def editUser
    puts "Edit user"
  end 

  def deleteUser
    puts "Delete user"
  end
end

# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users 
brain_teaser = BrainTeaser.new("DPLusers", 1)
puts brain_teaser.menu



#TODO
#.parsed_response["columb header"] - maybe need to add this and remove the JSON gem - do I need to use HTTParty.put("#{URL variable}")