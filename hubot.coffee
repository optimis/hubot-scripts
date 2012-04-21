# Allows hubot to upgrade himself and reload scripts.
#
# upgrade.

module.exports = (robot) ->
  robot.respond /upgrade$/i, (msg) ->
    @exec = require('child_process').exec
    command = 'cd /var/www/hubot && git pull && cd scripts && git pull && cd .. && npm install && forever restart 0'

    msg.send 'Upgrading ...'
    @exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr
