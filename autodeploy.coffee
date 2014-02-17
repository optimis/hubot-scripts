# Enables hubot to autodeploy applications.

module.exports = (robot) ->
  # [travis-ci] optimis/prime#286 (master - 3e9a445 : Umang Chouhan): the build has passed
  robot.hear /.*\/(.*)#.*passed/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]

    # environment = 'RC'
    # command = "knife deploy --application #{application} --environment #{environment}"
    
    msg.send "Build #{application} passed. Deploying #{application} to #{environment}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
