# Allows hubot to run commands using chef.
#
# uptime <server>

module.exports = (robot) ->
  robot.hear /uptime (.*)$/i, (msg) ->
    @exec = require('child_process').exec

    @server = msg.match[1]
    @command = "knife ssh '#{@server}' 'uptime'"
    
    msg.send "Checking #{@server} for uptime ..."

    @exec @command, (error, stdout, stderr) ->
      msg.send 'Standard Output'
      msg.send "#{stdout}"
      msg.send 'Standard Error'
      msg.send "#{stderr}"

      if error != null
        msg.send 'Error'
        msg.send "#{error}"
