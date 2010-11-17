# Ruby 1.9.2 in Production with Tatsuhiro Ujihisa

# Agenda

1. What is Ruby 1.9.2?
2. Difference between 1.8..1.9
3. Difference between 1.9.1..1.9.2
4. Difference between 1.9.2..1.9.3

# Background: Ruby versions

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

# Background: Ruby versions

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

# Example 1: Ruby as a template engine

PHP + Smarty
Haml

Ruby 1.9 new syntax

# Example 2: Ruby as a shell script

Spawn, system and open3

Open3.capture2e


# More...

* Local variable shadowing (less bug!)

# Notices

change between 1.8 and 1.9

* String isn't Enumerable
* when clause doesn't accept colon as semicolon

change between 1.9.1 and 1.9.2

* $: doesn't have the current dir.
require_relative is handy (but long...)

# Quote

* 1.8 is like svn while 1.9 is like git
* it's difficult to go back from 1.9 to 1.8
