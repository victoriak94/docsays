DOCSAYS

Front end and back end client for DocSays app.

Table of Contents

Motivation

DocSays is a diet management & recipe app that I built with my mom in mind. She's the main caretaker for my dad, who's been diagnosed with dementia and heart disease.

This app allows my mom to search through a list of pre-filtered recipes tailored to my dad's health conditions, something that assures her she's feeding him a diet that won't make him sicker.

The recipes are sourced from a third-party API and have been pre-filtered according to diet keywords provided by the patient's doctors and/or nutritionists.

Run DocSays Locally:

1. Clone this repository

2. In the repository's directory, install gems: 

  bundle install
	
3. In the repository's directory, run migration, seeds, and update task:

  rails update

  rails db:migrate

  rails db:seed
	
4. In the repository's directory, start the server:

  rails s

Tech Stack

Front-end:

- Ruby on Rails
- JavaScript

Back-end:

- Ruby on Rails
- PostgreSQL

Developer Team

Victoria Kamila - website - github - linkedin

Maryna Synko - website - github - linkedin

Dave Podgorski - github - linkedin
