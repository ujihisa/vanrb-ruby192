# Ruby 1.9.2 in Production with Tatsuhiro Ujihisa

# Before the talk...

* two questions
* easy one and normal one

# Question 1

An easy Ruby quiz: How to define a method without using "def" keyword?
(only with pure Ruby)

    def a
      :something
    end
    p a #=> :something

# Sample answer

    self.class.module_eval do
      define_method(:a) do
        :something
      end
    end
    p a

# Or

    eval 'def a; :something; end'
    p a

* There's no keyword def but string containing 'def'

I think there are a lot more answers

# Question 2

A normal Ruby quiz: How to assign a value to a local variable without using assignment operator "="?
(only with pure Ruby)

    a = :something
    p a #=> :something

# Sample answer 1

    for a in [:something]; end

    p a

* "Local variable" is very special in Ruby
* Declaring a new local variable is completely static

One more answer which is only on 1.9

# Sample answer 2

    /(?<a>).*/ =~ ''
    eval 'a=:something'

    p a

There are a match operator `=~` and a string which contains `=`, but no assignment operator `=`.

# Ruby 1.9.2 in Production with Tatsuhiro Ujihisa

![](http://www.h-online.com/imgs/43/5/5/8/3/2/8/ruby-logo-200-055ec6d14ab80eb7.png)

# This talk contains

1. What is Ruby 1.9.2?
2. Differences between 1.8..1.9
3. Differences between 1.9.1..1.9.2
4. Differences between 1.9.2..1.9.3

# The summary of this talk

"Ruby 1.9.2 makes your code cleaner and easier to maintain."

# Ruby versions

* Ruby 1.8.6
    * Mar 2007
* Ruby 1.8.7
    * May 2008
* Ruby 1.9.0
    * Dec 2007
* Ruby 1.9.1
    * Jan 2009
* Ruby 1.9.2
    * Aug 2010

# Ruby versions

* Ruby 1.8.6
    * Mar 2007
* Ruby 1.9.0
    * Dec 2007
    * _Rails 2.0_
* Ruby 1.8.7
    * May 2008
* Ruby 1.9.1
    * Jan 2009
* Ruby 1.9.2
    * Aug 2010
    * _Rails 3.0_

# Background: Ruby versions

* All of them are officialy stable version
* But Ruby 1.9 series didn't look like stable

# What's new?

* Which real problems did 1.9 solved?
* How can you write code easily?
* -> Examples

# Problems and solutions

* Verbose hash notation
* Difficulty in process handling

# Problem 1

About syntax

# Problem 1

JSON is cool. Dictionary in Erlang is cool. Hash in Ruby is...?

JavaScript or Erlang:

    {a: 1, b: 2, c: 3}

Ruby:

    {:a => 1, :b => 2, :c => 3}

# 1.9.2 new Hash syntax

This solved the problem

Ruby:

    {a: 1, b: 2, c: 3}

# This issue mattered particularly in..

Haml, the tool everyone is using, needs a lot of hash.

HTML:

    <img src="a.jpg" width="64" height="128"></img>

Haml with ruby variables:

    %img{:src => icon_path, :width => icon[:width], :height => icon[:height]}

(the below doesn't work)

    %img(src=icon_path width=icon[:width] height=icon[:height])

# This issue mattered particularly in..

Using 1.9.2 new hash syntax

    %img{src: icon_path, width: icon[:width], height: icon[:height]}

# Problem 2

* About builtin methods

# Problem 2

`system` or \`\` operator lacked some important functionalities.

* Ruby is a good shell script (Rakefile!),
* Ruby has some file/process handling methods,
* But..
    * You couldn't retrieve the output or error of `system`
    * You could run a command asynchronously with `system` with "&", but couldn't kill the process directly
    * You couldn't run a command asynchronously with \`\`

# Example

Start a Sinatra app by a Ruby script and kill the app by the script

in shell script:

    #!/bin/sh
    ruby sinatra_app.rb &
    PID=$!
    # something...
    kill $PID

in ruby?

# Bad solution

    system 'ruby sinatra_app &'

* You cannot get the proccess ID, so you cannot kill the process

# Better solution

    pid = fork do
      exec 'ruby', 'sinatra_app'
    end
    # something..
    Process.kill 'KILL', pid

* This doesn't work on NetBSD4 or Windows due to `fork()`

# Best solution

    pid = spawn 'ruby', 'sinatra_app'
    # something...
    Process.kill 'KILL', pid

* `:)`
* `spawn =~ {fork + exec} or {system + &}`
* portable

# New system and spawn spec

    system({'A' => 'b'}, 'c', in: input_io, [:out, :err] => :out)
    #=> true/false

    spawn(...)
    #=> Fixnum

# Even more..

`open3` standard library

* Open3.capture2e
* powered by spawn (read the source!)


# Problem 3

* Local variable shadowing (potantial bug!)

    a = :hello
    [1, 2, 3].each do |a|
      p a
    end
    p a #=> 3 (in 1.8)

# Problem 4

* "Most libraries didn't work"
* Yes it was (particularly on 1.9.1)

# now?

Active libraries work!

* nokogiri
* rails

# Problem 5

Installation

* install ruby, and then install rubygems, ...

# rubygems is builtin!

* rake as well

# How to make legacy code 1.9 compatible?

Changes between 1.8 and 1.9

* String isn't Enumerable
* when clause doesn't accept colon as semicolon

change between 1.9.1 and 1.9.2

* `$:` doesn't have the current dir.
    * require_relative is handy (but long...)

# Demo: make a gem library 1.9.2 compatible

* github gem library
* `github create` etc..
* it's very 1.8 even though it's new
    * 0.1.0 was March 3, 2008
    * 0.4.5 was Oct 25, 2010; after 1.9.2 public release!

# done.

![](http://www.h-online.com/imgs/43/5/5/8/3/2/8/ruby-logo-200-055ec6d14ab80eb7.png)

# Quote

> 1.8 is like svn while 1.9 is like git
> -- it's difficult to go back from 1.9 to 1.8

# The summary of this talk (again)

"Ruby 1.9.2 makes your code cleaner and easier to maintain."

# end

*thanks!*

talk by

* Tatsuhiro Ujihisa
* @ujm
* HootSuite Media, inc
* Ruby, Haskell, JavaScript, Vim script, etc..

![hootsuite](http://twittercism.com/wp-content/uploads/2010/02/hootsuite_icon.png)

# appendix

* JRuby
    * --1.9 option
    * almost compatible with 1.9 except `spawn()` or etc
