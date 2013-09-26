# Allows hubot to run commands using chef.
#
# uptime <server>

module.exports = (robot) ->
  robot.hear /uptime (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife ssh -x config --ssh-user root name:#{server} 'uptime'"

    msg.send "Checking #{server} for uptime ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.respond /configure (.*)$/i, (msg) ->
    server = msg.match[1]
    @exec = require('child_process').exec
    command = "knife ssh -x config --ssh-user root name:#{server} 'sudo chef-client'"

    msg.send "Configuring #{server}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
