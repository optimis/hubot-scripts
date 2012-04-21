# Allows hubot to upgrade himself and reload scripts.
#
# upgrade.

module.exports = (robot) ->
  robot.respond /upgrade$/i, (msg) ->
    @exec = require('child_process').exec
    command = 'cd /var/www/hubot && git pull && cd /var/www/hubot/src/optimis-scripts && git pull && forever restartall'

    msg.send 'Upgrading ...'
    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
