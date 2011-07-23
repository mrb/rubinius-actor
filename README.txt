Rubinius-Actor
==============

An implementation of the Actor concurrency model, from the Rubinius project.

Depends on Rubinius's core API class "Channel", built into Rubinius and
available for JRuby via the rubinius-core-api gem.

Installation
============

gem install "rubinius-actor"


Usage
=====

require 'rubinius/actor'
include Rubinius
this_io = STDOUT
actor = Actor.spawn{loop{
  Actor.receive{|m|
    m.when(IO){|io|
      sleep 3
      io << "\n***\nHi there! It's #{Time.now}!\n***\n"}
    }
  }
}
actor << this_io

Testing
=======

Rubinius-Actor is tested with RSpec.  Install rspec and from the project root,
run:

rspec spec/

Contribution
============


TODO
====


Credits
=======

Copyright 2007-2008  MenTaLguY <mental@rydia.net>
          2007-2011  Evan Phoenix <evan@fallingsnow.net>

