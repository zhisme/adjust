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

### Point to improve:
  * Change fake redis gem to real one (for production)
  * Add CI with linters to have code with satisfied quality
  * Add deployment steps (either capistrano/HELM)
  * Add documentation via swagger
  * Add some error-tracking system (e.g Rollbar)

#### Self-advertising:
  * take a look at my recently developed gem [lazy_names](https://github.com/zhisme/lazy_names)
