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
    end

Then, create a client instance with an authorized user's `ACCESS_TOKEN`

    @client = PortalClient::Client.new(ACCESS_TOKEN)

Now, you can make calls to the API thru your client instance

### Get All Courses

    courses = @client.courses

### Get One Course

    course = @client.course(COURSE_ID)

### Get Enrollments

    enrollments = @client.enrollments(COURSE_ID)

### Get Current User

    current_user = @client.users.current_user


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
