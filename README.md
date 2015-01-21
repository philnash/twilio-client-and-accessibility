# Exploring accessiblity and Twilio Client

This is an implementation of the [Twilio JavaScript Client](https://www.twilio.com/client) based on the [Ruby Quickstart](https://www.twilio.com/docs/quickstart/ruby/client). The master branch has the client in the state it would be if you were to follow the tutorial as directed (with a couple of extra bits, like a Gemfile and a config.ru file to make it easy to run).

## Running the example app

To run the application, make sure you have [Ruby](https://www.ruby-lang.org/) and the [Bundler gem](http://bundler.io/) installed. Clone or download this repo and then:

```shell
$ cd twilio-client-and-accessibility
$ bundle install
```

You will need to set up a [TwiML App](https://www.twilio.com/user/account/apps) within your account that points to a URL that your app is running on (I suggest using [ngrok for testing locally](https://www.twilio.com/blog/2013/10/test-your-webhooks-locally-with-ngrok.html)). You will also need a Twilio Number that you can use for caller ID. Once you have these, along with your Twilio credentials you will need to export them as environment variables.

```shell
$ export TWILIO_ACCOUNT_SID=AC1234...
$ export TWILIO_AUTH_TOKEN=fga53...
$ export TWILIO_APP_SID=AP1234...
$ export TWILIO_NUMBER=+44203...
```

Then you can run the app as follows:

```shell
$ bundle exec rackup
```

The application will be available at [http://localhost:9292/](http://localhost:9292/).

It should look like this:

![The Twilio Client Quickstart app](https://raw.github.com/philnash/twilio-client-and-accessibility/master/screenshots/client.png)
