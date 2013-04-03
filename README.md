# PortalClient

Ruby client library for the Starter League Portal API

## Installation

Add this line to your application's Gemfile:

    gem 'portal_client', :git => 'git://github.com/starterleague/portal_client.git'

And then execute:

    $ bundle

## Usage

Configure the client with your OAuth `APP_ID` and `SECRET`

    PortalClient.configure do |config|
      config.app_id   = APP_ID
      config.secret   = SECRET
      config.cache_store = Rails.cache
    end
    
Note the optional `cache_store` config option. You can pass a reference
to any ActiveSupport::Cache compatible cache store.

Then, create a client instance with an authorized user's `ACCESS_TOKEN`

    @client = PortalClient::Client.new(ACCESS_TOKEN)

Now, you can make calls to the API thru your client instance

### Years

    years = @client.years

  or

    year = @client.year(2012)

### Quarters

    quarters = @client.quarters

  or

    quarter = @client.quarter(QUARTER_ID)

### Courses

    courses = @client.courses

  or

    course = @client.course(COURSE_ID)


### Current User

    user = @client.users.current_user


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
