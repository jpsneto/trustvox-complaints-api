# trustvox_compliants_api
Trustvox - Backend Engineer Challenge

## Ruby version
2.7

## System dependencies
mongodb

## Deployment with docker
```
git clone git@github.com:jpsneto/trustvox-complaints-api.git
cd trustvox-complaints-api
docker-compose up -d
```

### Optinal seed data (creates 1000 sample complaints)
```
docker-compose exec app bundle exec rake db:seed 
```


## Api doc and try out
https://app.swaggerhub.com/apis-docs/jpsneto/trustvox-complaints-api/1.0.0