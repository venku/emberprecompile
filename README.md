# Ember Pre-Compile

Compiling handlebars for Ember JS library. 

Tested for Handlbars JS RC 4 and Ember JS RC 5 libraries.

## Installation

Add this line to your application's Gemfile:

    gem 'emberprecompile'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emberprecompile

## Usage

After installing gem, to setup with your project run:

	$ emberprecompile setup

Once the setup is done, to compile handlebars say:

	$ emberprecompile

Or

	$ emberprecompile compile
    
To keep monitoring changes in handlebar files say:

    $ emberprecompile watch

## Note

This gem no longer uses hardcoded folder names. This creates a "emberprecompile-config.rb" file in your project which holds the settings information. Directories can be changed to point to custom locations and users can choose their own file extensions and even specify output folder and file names.

By default handlebars directory is pointing to "views", with file extension of ".handlebars". And output directory will be "compiled" with file name "views.handlebars.js". 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
