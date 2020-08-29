[![Build Status](https://travis-ci.org/jpsneto/trustvox-complaints-api.svg?branch=master)](https://travis-ci.org/jpsneto/trustvox-complaints-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/e4582f46fe968f789438/maintainability)](https://codeclimate.com/github/jpsneto/trustvox-complaints-api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/codeclimate/codeclimate/test_coverage)
# trustvox-compliants-api
[Trustvox - Backend Engineer Challenge](https://gist.github.com/cleytonmessias/6098d0747743620dfc58f977a8f1ded7)

This API provides a service capable of receiving consumer complaints and retrieving them for research purposes, such as locale information

## Run on Docker
To start up the application in your local Docker environment:

```
git clone git@github.com:jpsneto/trustvox-complaints-api.git
cd trustvox-complaints-api
docker-compose build
docker-compose up -d
```

### Optinal seed data (creates 1000 sample complaints)
```
docker-compose exec app bundle exec rake db:seed 
curl -X GET "localhost:3000/api/v1/complaints" -H  "accept: application/json"
```

## Run on local machine
### System dependencies
Ruby 2.7
MongoDB 4.4 

### Run application
```
git clone git@github.com:jpsneto/trustvox-complaints-api.git
cd trustvox-complaints-api
gem install bundler:2.1.4
bundle install
```
Optinal seed data (creates 1000 sample complaints)
```
bundle exec rake db:seed
```
Start application

```
bundle exec rails s
```
### Run test suite
```
bundle exec rspec spec
```


## API doc
https://app.swaggerhub.com/apis-docs/jpsneto/trustvox-complaints-api/1.0.0
