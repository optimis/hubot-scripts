module.exports = (robot) ->
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
