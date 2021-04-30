## Setup

Install bundler:
```bash
gem install bundler
```

Then run:
```bash
bundle install
```

Install Nodejs (see actual version in the [package.json](package.json)),\
Then install **yarn** and project's dependencies:

```bash
npm install --global yarn
yarn install
```
   
## Run

Run migrations:
```bash
rails db:migrate RAILS_ENV=development
```

Run server:
```bash
rails server -b 0.0.0.0 -p 3000 -e development
```