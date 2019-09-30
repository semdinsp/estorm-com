require 'rubygems'
require 'bundler/setup'
require 'rack/ssl'

Bundler.require(:default)

use Rack::Deflater
use Rack::ConditionalGet
use Rack::ETag

puts "Envionment is: #{ENV['RACK_ENV']}"
if ENV['RACK_ENV']=='production'
#   use Rack::SSL    # SCOTT FIX LATER
#  puts "force ssl with rack-ssl in production environment"
end 


use Rack::Static, 
  :urls => ["/static","/upgrade"],
  :root => "content"

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

run Nesta::App

#use Rack::Auth::Basic, "Wolfram Area" do |username, password|
#  [username, password] == ['wolfram', 'wolf123']
#end

