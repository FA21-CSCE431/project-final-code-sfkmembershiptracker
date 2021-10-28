# README

## Setting Up the Environment
If you use GitHub desktop, skip the first two commands. When running rails css:install:tailwind, do NOT overwrite tailwind.config.js.
```
git clone https://github.com/spclark/sfk-membership-tracker.git
git checkout -b myBranchName dev
bundle install
rails db:create
rails db:migrate
rails css:install:tailwind
yarn build:css
```

## Running the Live Server
This app can be run entirely in a Docker container. In two terminals running simultaneously, run the following:
* To run the Rails live server: ```rails s --binding=0.0.0.0```
* To recompile stylesheets: ```yarn build:css --watch```\
  This will recompile any stylesheets you edit into a single stylesheet found at 'app/assets/builds.application.css'. To be more efficient, only Tailwind classes that are being used in the app are added to this stylesheet. You can run the command without the --watch flag to recompile at any time.

## General Info
* Routing info is found in 'config/routes.rb'. You'll notice that static pages are displayed using the routes_controller.
* With the exception of the navbar, any partial views (forms, for example) are found in 'app/views/partials/'. Static pages are found in 'app/views/routes/'.
* All database entities were created using the default Rails scaffold. These should be modified as needed for security and brevity.

## OAuth
* OAuth is implemented using Devise with Omniauth. Add the following to any controller that requires a user to be logged in:
  ```before_action :authenticate_user!```\
  If the user is not logged in, they will be redirected to a page prompting them to do so.
* OAuth logins are stored in the users table. It stores a user's full name, email, UID, avatar URL, and a timestamp of when the user last logged in. Currently, a user can be "remembered" for 2 weeks before they have to log in again. This, along with other Devise settings, can be changed in 'config/initializers/devise.rb'.
* Users must log in with a TAMU email (@tamu.edu).
* Environment variables for OAuth are stored in the files found under 'config/environments/'. These files are included in our .gitignore, so you will need to add these variables yourself after forking the repo.

## Stylesheets/Tailwind
* Stylesheets go in the 'app/assets/stylesheets/' directory.
* If you would like to extend the default Tailwind theme, you can edit the file tailwind.config.js found in the root of the project directory. You can find more info on customizing Tailwind [here](https://tailwindcss.com/docs/configuration).
* The colors maroon (#500000) and maroon-dark (#300000) have been added to the Tailwind theme. You can use them like any other color class in Tailwind.
