
<h1  align="center">Laravel Product App</h1>

## About The App
This laravel app was created for the purpose of demonstrating CRUD functionality for an online exam.

## Server Requirements

The Laravel version of this app is version 5.7. Please check out https://laravel.com/docs/5.7#server-requirements
for the server requirements.

## Installation

<b>NOTE: You will need to create a virtual host domain called http://product-app.local and you need to point the application to this domain for it to work properly.</b>

Clone the project using:
<code>git clone https://github.com/michael-roewin/Laravel-Product-App.git</code>

If you are using linux, open the terminal then go to the project directory and run this commands<br>
<code>chmod -R 777 bootstrap/cache/ <br>
&nbsp;chmod -R 777 storage
</code>

You need to install composer for the libraries needed for the app.
https://getcomposer.org/

Once composer is installed run: <code>composer update</code> on the project directory.

After running <code>composer update</code>
You will need to run: <code>php artisan passport:keys</code>


## Import DB
Import the product-app.db file that is located inside the project directory to mysql.<br><br>
<b>User Credentials</b><br>
username: admin<br>
password: admin

## Create  .env file
copy the .env.example file and rename it as .env files and Aedit the configuration.

## Notes
The view files of this laravel product app app came from the angular build in https://github.com/michael-roewin/Angular-Product-App.