module.exports = (robot) ->
  robot.respond /times$/i, (msg) ->
    spawn = require('child_process').spawn
    API_KEY = "g728y37tz9xdyyurnw97d8f5"
    API_URI = "http://api.worldweatheronline.com/free/v1/tz.ashx?format=json&key=#{API_KEY}&q="

    offices = {
      TW: 'Taipei',
      PHIL: 'manila',
      India: 'India',
      Fibernet: '84097',
      LA: 'LA'
    }

    times = ""
    msg.http(API_URI+offices['TW']).get() (err, res, body) ->
      currentTime = JSON.parse(body)['data']['time_zone'][0]['localtime'].slice 5
      times += "TW: #{currentTime}\n"
      msg.http(API_URI+offices['PHIL']).get() (err, res, body) ->
        currentTime = JSON.parse(body)['data']['time_zone'][0]['localtime'].slice 5
        times += "PHIL: #{currentTime}\n"
        msg.http(API_URI+offices['India']).get() (err, res, body) ->
          currentTime = JSON.parse(body)['data']['time_zone'][0]['localtime'].slice 5
          times += "India: #{currentTime}\n"
          msg.http(API_URI+offices['Fibernet']).get() (err, res, body) ->
            currentTime = JSON.parse(body)['data']['time_zone'][0]['localtime'].slice 5
            times += "Fibernet: #{currentTime}\n"
            msg.http(API_URI+offices['LA']).get() (err, res, body) ->
              currentTime = JSON.parse(body)['data']['time_zone'][0]['localtime'].slice 5
              times += "LA: #{currentTime}\n"
              msg.send times

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

