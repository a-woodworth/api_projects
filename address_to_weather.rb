require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

url_of_location_data = "http://maps.googleapis.com/maps/api/geocode/json?address=" + "#{url_safe_address}"
location_data = open(url_of_location_data).read
parsed_location_data = JSON.parse(location_data)
the_latitude = parsed_location_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_location_data["results"][0]["geometry"]["location"]["lng"]

#puts the_latitude
#puts the_longitude

weather_url_coordinates = "https://api.forecast.io/forecast/59ea33818c0b4591622820cac6cbef25/" + "#{the_latitude},#{the_longitude}"

raw_weather_data = open(weather_url_coordinates).read
parsed_weather_data = JSON.parse(raw_weather_data)
the_temperature = parsed_weather_data["currently"]["temperature"]
the_hour_outlook = parsed_weather_data["minutely"]["summary"]
the_day_outlook = parsed_weather_data["hourly"]["summary"]

# Ultimately, we want the following line to work when uncommented:

 puts "The current temperature at #{the_address} is #{the_temperature} degrees."
 puts "The outlook for the next hour is: #{the_hour_outlook}"
 puts "The outlook for the next day is: #{the_day_outlook}"
