# Allows hubot to run commands using chef.
#
# uptime <server>

module.exports = (robot) ->
  robot.hear /uptime (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife ssh name:#{server} 'uptime'"

    msg.send "Checking #{server} for uptime ..."

    process = spawn command

    process.stdout.on 'data', (data) ->
      msg.send data

    process.stderr.on 'data', (data) ->
      msg.send data

    process.on 'exit', (code) ->
      msg.send code

  robot.respond /configure (.*)$/i, (msg) ->
    server = msg.match[1]
    @exec = require('child_process').exec
    command = "knife ssh -x ec2-user -i ~/.ssh/aws name:#{server} 'sudo chef-client'"

    msg.send "Configuring #{server}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
