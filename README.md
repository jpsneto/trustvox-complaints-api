# trustvox_compliants_api
Trustvox - Backend Engineer Challenge

## Ruby version
2.7

## System dependencies
mongodb

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
curl -X GET "localhost:3000/api/v1/complaints/count" -H  "accept: application/json"
```


## Api doc and try out
https://app.swaggerhub.com/apis-docs/jpsneto/trustvox-complaints-api/1.0.0