## Description
Application that receives a log as argument (webserver.log is provided).

Return the following:
- list of webpages with most page views ordered from most pages views to less page views, for example:
  * /home 90 visits
  * /index 80 visits

- list of webpages with most unique page views also ordered, for example:
  * /about/2 8 unique views
  * /index 5 unique views

## Instalation && Usage
- Ruby (2.6.5) with gems
  * rubocop
  * rspec
  * simplecov

```
$ bundle install
$ bin/parser.rb logs/webserver.log
```