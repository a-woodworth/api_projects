require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

weather_url_coordinates = "https://api.forecast.io/forecast/59ea33818c0b4591622820cac6cbef25/" + "#{the_latitude},#{the_longitude}"

raw_weather_data = open(weather_url_coordinates).read

# -- Checking to make sure request formatting works --
# puts weather_url_coordinates
# puts raw_weather_data.class
# puts "<=================================>"
# puts raw_weather_data.length
# puts "<=================================>"
# puts raw_weather_data

 parsed_weather_data = JSON.parse(raw_weather_data)

# puts parsed_weather_data.class
# puts parsed_weather_data.keys

current_weather_results = parsed_weather_data["currently"]

# puts current_weather_results.class
# puts current_weather_results.length
# puts current_weather_results

the_temperature = current_weather_results["temperature"]

# -- Temperature listed in degrees Fahrenheit --
# puts the_temperature

weather_forecast_by_minute = parsed_weather_data["minutely"]

# puts weather_forecast_by_minute.class
# puts weather_forecast_by_minute.length
# puts weather_forecast_by_minute

the_hour_outlook = weather_forecast_by_minute["summary"]

# puts the_hour_outlook

weather_forecast_by_hour = parsed_weather_data["hourly"]

# puts weather_forecast_by_hour.class
# puts weather_forecast_by_hour.length
# puts weather_forecast_by_hour

the_day_outlook = weather_forecast_by_hour["summary"]

# puts the_day_outlook


# Ultimately, we want the following line to work when uncommented:

 puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
 puts "The outlook for the next hour is: #{the_hour_outlook}"
 puts "The outlook for the next day is: #{the_day_outlook}"
