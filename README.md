# Blueprint API

## Production endpoint
```
POST https://blueprint-assessment-api.herokuapp.com/v1/screener/score
```

## Running locally

### Prerequisites
1. Sqlite 3
2. Ruby version 3.1.2

Seed the database
```
sqlite3 development.sql ".read setup_db.sql"
```

Install dependencies and start the server
```
bundle install

gem install rackup

rackup
```

## Description of the problem and solution
I chose to structure my solution as a Sinatra API backend with a single page application frontend. This allows separation of concerns between the presentation layer and the backend. This API contains one endpoint `/v1/screener/score` which accepts a completed screener and returns a set of assessments to be administered. Data must be passed to the endpoint via a POST request.
    
## Reasoning behind your technical choices
I chose to build my API using Ruby/Sinatra because it's lightweight and allows for fast iteration - perfect for interview scenarios. In a real work scenario I might choose a different language/framework based on the need. For instance, if I knew that this API needs to quickly scale to a lot of concurrent users I might choose another, more performant, language.

My database is SQlite. This is obviously not an option for a production database and is meant only for prototyping. In a real world I would use something like Postgres, MongoDB, etc. Given the structure of these evaluations I think a document store could be a good option.

## Describe how you would deploy this as a true production app on the platform of your choice:
### How would ensure the application is highly available and performs well?
Assuming that I'm keeping the application deplayed as it is - an API service using Sinatra - I would containerize this application using Docker and deploy to a container orchestration platform like Amazon Elastic Container Service. It allows you to easily package the app into a docker image and scale as needed.

I would imagine that this api could become more complex however. The calculations performed are quite simple and sensible for the server to compute on the fly. But if that calculation became more complex - backed by an ML service, needs to pull in additional data for calculations, etc. - I might consider trying to push responses onto a queue / messaging system and process the results asynchronously. This would depend largely on how important it is to return an immediate result to the user. But if it's acceptable to have a slight delay it might be cheaper and more scalable to process evaluatioins asynchronously.

### How would you secure it?
- SSL is not currently enforced for the API. I would make this required at the web server and application level
- There is currently no authentication/authorization for the api. Given that the frontend is a SPA I might implement authentication via AWS Amplify or something similar.
- Because the frontend is an SPA, CORS requests will need to be permitted but should be limited to the expected domains 

### What would you add to make it easier to troubleshoot problems while it is running live?
- Logging & monitoring: Something like Amazon Cloud Watch to track request volume, server loads, memory consumptions, etc.
- Exception tracking: I've used things like Sentry, Bugsnag, etc. in the past.

### Trade-offs you might have made, anything you left out, or what you might do differently if you were to spend additional time on the project
Sqlite was obviously a trade-off and I would not use it in production. Just wanted to get running quickly.

### Link to other code you're particularly proud of
*Lurn*
I've not touched this in a while but started a machine learning library for Ruby, similar to scikit klearn.
https://github.com/dansbits/lurn


### Link to your resume or public profile
https://github.com/dansbits

Please send these deliverables over at least 48 hours in advance of your scheduled interview time so we can review and come prepared with questions! If we don't receive your submission, we may opt to cancel or reschedule the interview so we can be sure we're using your and our time effectively