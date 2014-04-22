rem For windows only will compile sass and coffee
start sass --watch --trace -c src:css
rem Outputs script.js to lib folder, Joins, Compiles, and Watches files in the src folder
start coffee -o lib/ -j script.js -cw src/