# Dingus Server

This is a very simple Rack app to implement a web service for John MacFarlane's
[Babelmark2](http://johnmacfarlane.net/babelmark2/) comparison of Markdown
interpreters.

It accepts HTTP GET requests --- with one parameter consisting of the
Markdown text to be interpreted --- and responds with a JSON object containing
the name of the Markdown interpreter ("Maruku"), the version number, and the
parsed text.

## Installation

Run

     bundle install --path vendor/bundle

## Standalone operation

For standalone operation, run

     bundle exec rackup -p 3000 -s thin

and then access the server at

    http://localhost:3000/json?text=....

## Using Passenger

Make sure the `config/environment.rb` file is owned by the
user running the httpd server

    chown www config/environment.rb

Add 

     PassengerPreStart http://myhost.com/dingus/json
	 RackBaseURI /dingus
	
to your `httpd.conf` file (adjusting the sub-URI where you
want the server to appear, according to taste).

Create a soft-link between the `public` directory and the desired
point in the webserver's document tree

     ln -s /path/to/dingus-server/public /usr/local/apache/htdocs/dingus

Restart Apache, and then access the server at

    http://myhost.com/dingus/json?text=....

## Other Markdown interpreters

Customize the `parse`, `parser_name` and `parser_version` methods in `app/controller/application_controller.rb` to suite your Markdown interpreter. Edit the `Gemfile` appropriately, and you are off to the races.
