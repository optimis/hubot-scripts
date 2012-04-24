# Allows hubot to upgrade himself and reload scripts.
#
# upgrade.

module.exports = (robot) ->
  robot.respond /(upgrade|reboot|restart|power up|level up)$/i, (msg) ->
    @exec = require('child_process').exec
    command = 'cd /var/www/hubot && git pull && npm install && forever restart 0'

    msg.send 'upgrading ...'
    @exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr

    command = 'cd /var/www/hubot/scripts && git pull origin master && forever restart 0'

    msg.send 'syncing scripts ...'
    @exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr