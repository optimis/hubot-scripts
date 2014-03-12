module.exports = (robot) ->
  robot.respond /time$/i, (msg) ->
    spawn = require('child_process').spawn
    API_KEY = "g728y37tz9xdyyurnw97d8f5"
    API_URI = "http://api.worldweatheronline.com/free/v1/tz.ashx"

    offices = {
      LA: 'LA',
      India: 'India',
      TW: 'Taipei',
      PHIL: 'manila',
      Fibernet: '84097'
    }

    for key in offices
      msg.http(API_URI).query({
        q: offices[key]
        key: API_KEY
        format: 'json'
      }).get() (err, res, body) ->
        result = JSON.parse(body)['data']
        currentTime = result['time_zone'][0]['localtime'].slice 5
        msg.send "#{key}: #{currentTime}"

  robot.respond /time in (.*)$/i, (msg) ->
    spawn = require('child_process').spawn
    API_KEY = "g728y37tz9xdyyurnw97d8f5"
    API_URI = "http://api.worldweatheronline.com/free/v1/tz.ashx"

    msg.http(API_URI).query({
      q: msg.match[1]
      key: API_KEY
      format: 'json'
    }).get() (err, res, body) ->
      try
        result = JSON.parse(body)['data']
        city = result['request'][0]['query']
        currentTime = result['time_zone'][0]['localtime'].slice 5
        offset = result['time_zone'][0]['utcOffset']
        msg.send "Current time in #{city} => #{currentTime} (UTC #{offset})"
      catch error
        msg.send "Sorry, no city found. Please, check your input and try it again"

  robot.respond /ping (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    dest = msg.match[1]
    command = "ping -c 3 -s 32 #{dest}"

    msg.send "#{command} ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.respond /hostname$/i, (msg) ->
    spawn = require('child_process').spawn

    command = "hostname"

    msg.send "#{command} ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

