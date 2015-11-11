# JobBoard

This app makes use of [json-server](https://github.com/typicode/json-server) to
function as the database of a rails app.

It is a mock job board that keeps track of users' interest in various jobs and allows employers to post new openings.

### Set Up locally

1. clone git repo
2. In the root project folder, run: `gem install bundler`
3. `bundle install`
4. `rake db:create && db:migrate`
5. `npm install -g json-server`

### Visit site locally

1. In the root project folder, run: `json-server --watch data.json`
2. In a new terminal tab, run: `rails s -p 3500`
3. You can now visit the job board at [localhost:3500](http://localhost:3500/)
