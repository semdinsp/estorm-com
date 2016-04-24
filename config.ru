require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

use Rack::Deflater
use Rack::ConditionalGet
use Rack::ETag

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

