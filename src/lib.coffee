# Simon's function lib
# Personal Library for Functions

# Function rounds numbers to decimal certain decimal place
# Takes in a num and a round to point
Math.roundTo = (num, amount = 0) ->
   Math.round(num * Math.pow(10,amount)) / Math.pow(10,amount)

# Adds a timestamp to console.log
console.logDate = ->
   if arguments.length
      timestamp = '[' + new Date().toUTCString() + '] '
      console.log(timestamp, arguments)