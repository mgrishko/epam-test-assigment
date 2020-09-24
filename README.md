#### Description

Application that receives a log as argument (webserver.log is provided).

Return the following:
- list of webpages with most page views ordered from most pages views to less page views, for example:
  * /home 90 visits
  * /index 80 visits

- list of webpages with most unique page views also ordered, for example:
  * /about/2 8 unique views
  * /index 5 unique views

#### Instalation && Usage
  * Ruby (2.6.5) with gems
  * rubocop
  * rspec
  * simplecov

```
$ bundle install
$ bin/parser.rb logs/webserver.log
```

#### Tests && Coverage && Linter
This also show test coverage from the Simplecov.
```
$ rspec
```
And ruby linter - Rubocop:
```
$ rubocop
```

#### Approach description
* Use SOLID, TDD, OO
* Validates file existence and required extension and valid content of file
* Count, sort and present file content

#### Possible Improvements
* Use dry-rb stack, for (mixins, do-monads) for standartize responds from services and more clean code
* Extend validations, maybe for real case, need more strict validations for ip example (ip =~ Regexp.union([Resolv::IPv4::Regex, Resolv::IPv6::Regex]))
* Load file by chunks
