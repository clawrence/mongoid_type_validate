# MongoidTypeValidate

  The Mongoid3 Gem mongoizes the field types to the specified type 
  before the Rails Validations on a model can run.  This Gem 
  will generate errors on a model with descriptive meaningful 
  validation messages if the types are not appropriate.
  Currently supported fields:  Float, Integer, Time, and DateTime.

  The Gem was developed with mongoid 3.1.6 and ruby 1.9.3.

  Internationization is not currently supported..

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid_type_validate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_type_validate

## Usage

  The Gem must be installed and loaded after the Mongoid3 gem.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mongoid_type_validate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
