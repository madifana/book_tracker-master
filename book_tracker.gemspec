# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'book_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "book_tracker"
  spec.version       = BookTracker::VERSION
  spec.authors       = ["Ken Holmquist"]
  spec.email         = ["madifana@yahoo.com"]

  spec.summary       = %q{This application allows a user to create an account that can be logged into and out of, list books that have been read, view a list of those books, and update or delete any books listed.}
  spec.homepage      = "https://github.com/madifana/book_tracker-master"

end