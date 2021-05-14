## Setup

Install bundler
```bash
gem install bundler
```

Then
```bash
bundle install
```

## Run

Migrations:
```bash
rails db:migrate RAILS_ENV=development
```

Server:
```bash
rails server -b 0.0.0.0 -p 3000 -e development
```