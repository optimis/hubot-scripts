# Allows hubot to run commands using chef.
#
# list nodes - Lists all nodes on Opscode
# uptime <server> - Prints uptime
# configure <server> - Runs chef client on node

module.exports = (robot) ->
  robot.respond /list nodes$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife node list"

    msg.send "Listing nodes ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.respond /uptime (.*)$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife ssh --ssh-user root name:#{server} 'uptime'"

    msg.send "Checking #{server} for uptime ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.respond /configure (.*)$/i, (msg) ->
    server = msg.match[1]
    @exec = require('child_process').exec
    command = "knife ssh --ssh-user root --attribute ipaddress --no-color name:#{server} 'sudo chef-client'"

    msg.send "Configuring #{server}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.respond /configure-environment (.*)$/i, (msg) ->
    environment = msg.match[1]
    @exec = require('child_process').exec
    command = "knife ssh --ssh-user root --no-color --attribute ipaddress chef_environment:#{environment} 'sudo chef-client'"

    msg.send "Configuring #{environment}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
