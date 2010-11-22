#!/usr/bin/ruby
require 'rubygems'
require 'haml'

a = '%img(src=icon_path width=icon[:width] height=icon[:height])'
a = '%img{:src => icon_path, :width => icon[:width], :height => icon[:height]}'
a = '%img{src: icon_path, width: icon[:width], height: icon[:height]}'
icon_path = 'hello'
icon = {:width => 10, :height => 20}
puts Haml::Engine.new(a).to_html(binding)
#, {icon_path: icon_path, icon: icon}
