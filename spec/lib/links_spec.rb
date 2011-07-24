require File.expand_path('../../spec_helper', __FILE__)
require 'rubinius/actor'

describe "Actor.current.links" do
  it "returns an array of actors linked to this actor" do
    links = Actor.current.links
    links.length.should == 0

    a = Actor.spawn_link{loop{}}
    b = Actor.spawn_link{loop{}}

    links = Actor.current.links
    links.length.should == 2

    Actor.unlink(a)
    Actor.unlink(b)

    links = Actor.current.links
    links.length.should == 0
  end
end

