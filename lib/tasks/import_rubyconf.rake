require 'json'

namespace :import do
  desc "import rubyconf json"
    task :rubyconf => :environment do 
      json_file = File.open("db/rubyconf_json.txt")
      json_file.each {|x| @output = JSON.parse(x)}
      # puts @output.first.keys.inspect
      
      @output.each {|x| 
       tickets = x["booking"].delete "tickets"
       attendee = Attendee.create(x["booking"]) 
       tickets.each do |hash|
         ticket = Ticket.create hash["ticket"]
         ticket.update_attribute :attendee_id, attendee.id
       end
       puts "Created Attendee #{attendee.last_name}, with #{tickets.count} tickets"
       }
    end
  end