# trustvox-compliants-api
Trustvox - Backend Engineer Challenge (gist)[https://gist.github.com/cleytonmessias/6098d0747743620dfc58f977a8f1ded7]

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
