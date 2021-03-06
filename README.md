# Loopi v0.0.2
[![Build Status](https://travis-ci.org/ifricker/running_app.svg?branch=development)](https://travis-ci.org/ifricker/running_app)

## Application Summary
Run from Routine.

Loopi is a web app created out of a desire to take the monotony out of running while also making it more efficient. Input a desired distance for your run and Loopi will find your location and generate a random route where the endpoint is where you started.

By using Ruby on Rails and PostgreSQL, Loopi allows users to create a profile and save their favorite routes for future use. A focus on intuitive and responsive web design makes Loopi easy to use on both desktop and mobile devices, while the incorporation of Google Maps API provides users with accurate and customizable routes, as well as turn-by-turn directions. 

The first MVP of Loopi was completed in one week.

## Configuration / Set-up
- Ruby version 2.2.2
- Rails version 4.2.6

Once you have these installed, run a bundle install and migration. You can now access the application.

## Deployment
Loopi is deployed on Heroku.
- [Production](https://random-running-app.herokuapp.com/ "Loopi Production")
- [Staging](https://random-running-app-staging.herokuapp.com/ "Loopi Staging")

## Running a Test Suite
Run the command: `bundle exec rspec spec`

## Git Workflow
Loopi uses the [git flow workflow](https://danielkummer.github.io/git-flow-cheatsheet/ "git-flow").

## Make a Route
Users input the desired length of the run and can input a start/end location (Loopi defaults to the current location).
![Loopi](/app/assets/images/loopi_home.png "Home page")

Loopi generates and displays the route.
![Loopi Map](/app/assets/images/loopi_map.png "Map of route")

Users can view total length of route and turn-by-turn walking directions.
![Loopi Directions](/app/assets/images/loopi_directions.png "Route directions")

## PostgreSQL Schema
![Schema](/app/assets/images/schema.png "schema")

