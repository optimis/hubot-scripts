# Allows hubot to deploy applications using whiskey disk.
#
# deploy <application>:<environment> - Deploys 'application' to the 'environment'.

module.exports = (robot) ->
  # robot.hear /\[optimis\/develop\].*/i, (msg) ->
  #   unless robot.brain.deploying
  #     robot.brain.data.deploying = true

  #     @exec = require('child_process').exec

  #     @application = 'optimis'
  #     @target = 'megatron'
  #     @command = @application + ':' + @target

  #     msg.send 'Deploying ' + @application + ' to ' + @target

  #     @exec 'cd ' + process.env.HUBOT_WD_PATH + ' && wd deploy --to=' + @command, (error, stdout, stderr) ->
  #       msg.send 'Standard Output: ' + stdout
  #       msg.send 'Standard Error: ' + stderr
  #       msg.send 'Error: ' + error if error != null
  #       robot.brain.data.deploying = false

  robot.hear /deploy ([\w .-]+):([\w .-]+)$/i, (msg) ->
    @exec = require('child_process').exec

    @application = msg.match[1]

    if [ 'auth', 'billing', 'data_wrangler', 'decryptor', 'messaging', 'optimis', 'reporting', 'scheduling' ].indexOf(@application) > -1
      @target = msg.match[2]
      @command = @application + ':' + @target

      if @target == 'production'
        msg.send 'Coming Soon ...'
      else
        msg.send 'Deploying ' + @application + ' to ' + @target

        @exec 'cd ' + process.env.HUBOT_WD_PATH + ' && wd deploy -d --to=' + @command, (error, stdout, stderr) ->
          msg.send 'Standard Output: ' + stdout
          msg.send 'Standard Error: ' + stderr
          msg.send 'Error: ' + error if error != null
    else
      msg.send 'Application not configured for deployments using Whiskey Disk ...'
