class ApplicationController < ActionController::Base
   before_filter :cors_set_access_control_headers
   
   private
   
   def cors_set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'PUT, POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type, X-Requested-With, X-Prototype-Version'
   end
end
