# 📧 SendGrid Email Status

A Rails application that sends emails via the SendGrid API and tracks their status.

## Running the application

### Requirements

You will need:

* Ruby (2.5.0 or newer) and Bundler
* [ngrok](https://ngrok.com) - to tunnel webhooks through to your local machine
* A Twilio SendGrid account (if you don't have one, you can [sign up for a free SendGrid account now](https://signup.sendgrid.com/))

### Getting started

Clone the application:

```bash
git clone https://github.com/philnash/sendgrid-email-status.git
cd sendgrid-email-status
```

Install the dependencies:

```bash
bundle install
```

Copy the `config/env.yml.example` file to `config/env.yml`. Then fill in the `config/env.yml` with an email address you want to use to send emails and a SendGrid API key that can send email.

```bash
cp config/env.yml.example config/env.yml
```

Start the application:

```bash
bundle exec rails server
```

Visit the application at [http://localhost:3000](http://localhost:3000).