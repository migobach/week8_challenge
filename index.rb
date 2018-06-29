require 'pry'
require 'httparty'
require 'json'


class BrainTeaser
  include HTTParty
  base_uri 'http://json-server.devpointlabs.com/api/v1/users'
  
  def initialize(users, page)
    @users = { query: { site: users, page: page } }
  end
  
  def getUsers
    list = self.class.get("/", @users) #.parsed_response - maybe need to add this and remove the JSON gem - do I need to use HTTParty.put("#{URL variable}")
    puts list

  #   list.each do 
  #     { |u| print list[u].values_at("first_name") }
  #   end
  # binding.pry
  end

  def singleUser
    puts "insert a user id"
    id = gets.strip.to_i
    single = self.class.get("/#{id}", @users)
    puts single
  end
end

# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users 
brain_teaser = BrainTeaser.new("DPLusers", 1)
puts BrainTeaser brain_teaser.getUsers
puts BrainTeaser brain_teaser.singleUser