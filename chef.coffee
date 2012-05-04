# Allows hubot to run commands using chef.
#
# uptime <server>

module.exports = (robot) ->
  robot.hear /uptime (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife ssh '#{server}' 'uptime'"

    msg.send "Checking #{server} for uptime ..."

    process = spawn command

    process.stdout.on 'data', (data) ->
      msg.send data

    process.stderr.on 'data', (data) ->
      msg.send data

    process.on 'exit', (code) ->
      msg.send code
