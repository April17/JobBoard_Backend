# Job Board Backend

* Ruby version:
    ruby '2.7.2'
* System dependencies:
    Developed on Windows 10
* PostgreSQL: 
    PostgreSQL 13

## PostgreSQL Setup
1. Please configure `username` and `password` in `./config/database.yml` accroding to your own PostgreSQL.
2. Creat database `JobBoard_Backend_development`, with defult `port: 5432`, `username` and `password`

## PostgreSQL Tables
1. `job_boards`, `job_opportunities` and `job_board_job_opportunities`.
2. Relations
    ### `job_boards` has many `job_opportunities` through `job_board_job_opportunities`
    ### `job_opportunities` has one `job_board` through `job_board_job_opportunity`
    ### `job_board_job_opportunity` belongs to `job_opportunity` and `job_board`
3. The reason to creat a Joiner Table is for `job_opportunities` can exist with out any dependency. The current version of the project will not use this relation. It may be used in the future updates.

## Backend Setup
1. CD into `JobBoard_Backend`
2. Run `bundle install`, `rails db:migrate` and `rails db:seed`
    #### Seeding will take a bit of time for 20,000 data
3. Run `rails s` to stat the backend server. Usually, it will be at `localhost:3000`.

## Backend API Routs
### All rout is based on `localhost:3000`, yours could be different.
1. Job Board Index: http://localhost:3000/job_boards
2. Job Opportunities Show: `http://localhost:3000/job_opportunities/#{Job Source}?page=#{Page Number}`
    #### Example: http://localhost:3000/job_opportunities/Google?page=1
3. Job Count Custom Rout: http://localhost:3000/job_count

## Backend Third Party Gems
1. pagy
    #### Used for pagination, Creat smaller package for each API Call.
    #### 20 Items per call, can be configure in pagy.rb in `./config/initializers`.
    #### Provide Pager information for Frontend to change pages.
2. active_model_serializers
    #### Create custom Json Response, Take out unnecessary data like created_time, updated_time and etc. 

## Backend CSV and Json Import
1. CSV and Json file are taken from `./lib/seeds`.
2. All data is seed using `seeds.rb` in `./db`.
3. All Job Boards are seeded first.
4. New JobOpportunity will be created with assocated data and set `job_source` to `Unknown`.
5. If `Company Name` is included in the URL, `"Company WebSite"` will be assigned to `job_source`.
    #### Save to DB
    #### If `root_domain` is also included in the URL, `job_board_job_opportunities` will also be created, if not `job_board_job_opportunities` will not be created.
    #### Break out the loop and go to next job_opportunity.
6. If `root_domain` is included in `job_URL`, `job_board_job_opportunities` will also be created.
    #### Save to DB, Break out the loop and go to next job_opportunity.
7. If there is no match, `job_source` will be kept as `Unknown` and `job_board_job_opportunities` will not be created.
    #### Save to DB
8. The reason to create a joiner table is for future use and let `job_opportunities` exist by itself. Current version of the project could create two table with no relision and use `job_source` to filter correct data.

## About Job Source Resolution Data
1. the `job_opportunities` is created based on the sample data.
2. when the sorce CSV imported into DB, `seed.rb` will resolve it.
3. the CSV file can be download from `pgAdmin 4` and in `./lib/seeds`

## About Job Source and the Total Count of Job Opportunities
1. The data can be found in http://localhost:3000/job_count
