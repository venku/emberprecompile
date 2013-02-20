# Ember Pre-Compile

Compiling handlebars for Ember JS library. Supported versions of libraries are Handlbars JS RC 3 and Ember JS RC 1.


## Installation

Add this line to your application's Gemfile:

    gem 'emberprecompile'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emberprecompile

## Usage

After installing gem, to compile handlebars say:

	$ emberprecompile

Or

	$ emberprecompile compile
    
To keep monitoring changes in handlebar files say:

    $ emberprecompile watch

## Note

It expects "views" and "compiled" folders are existing in current location. Currently all handlebars are placed under "views" folder with ".handlebars" extension. Compiled handlebars are placed under "compiled" folder in "views.handlebars.js" file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
