# README

* Ruby version: `2.7.1`

### Run specs:
 * `bundle exec rspec`
 * `bundle exec rubocop`

### Run rails server:
  * `bundle exec rails s`
  * `open http://localhost:3000`

### Docker:
  * `docker build . -t adjust`
  * `docker run -e SECRET_KEY_BASE=xxx RAILS_SERVE_STATIC_FILES=1 -p 3000:80 adjust`
