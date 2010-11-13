require 'rubygems'
require 'haml'
p RUBY_VERSION
puts Haml::Engine.new('%a{b: "c"}').to_html
