# Allows hubot to run commands using chef.
#
# uptime <server>

module.exports = (robot) ->
  robot.hear /uptime (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife ssh -x config name:#{server} --attribute ipaddress 'uptime'"

    msg.send "Checking #{server} for uptime ..."

    uptime = spawn command

    uptime.stdout.on 'data', (data) ->
      msg.send data

    uptime.stderr.on 'data', (data) ->
      msg.send data

    uptime.on 'exit', (code) ->
      msg.send code

  robot.respond /configure (.*)$/i, (msg) ->
    server = msg.match[1]
    @exec = require('child_process').exec
    command = "knife ssh -c ~/.chef/knife.rb -x ec2-user -i ~/.ssh/aws name:#{server} 'sudo chef-client'"

    msg.send "Configuring #{server}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
