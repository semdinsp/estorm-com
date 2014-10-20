require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

use Rack::ConditionalGet
use Rack::ETag

use Rack::Static, 
  :urls => ["/static","upgrade"],
  :root => "content"

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

run Nesta::App
