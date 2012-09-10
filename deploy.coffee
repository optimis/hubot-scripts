# Allows hubot to switch applications to maintenance mode.
#
# maintain <application> on <environment> - Switches <application> on <environment> to maintenance mode.
# restore <application> on <environment> - Restores <application> on <environment> from maintenance mode.
# deploy <application> to <environment> - Deploys <application> to <environment>.

module.exports = (robot) ->
  robot.respond /maintain (.*) on (.*)$/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]
    environment = msg.match[2]
    user = msg.message.user
    command = "knife maintain --application #{application} --environment #{environment}"
    authorized = (environment != 'prod' or [ 495388, 496930, 668118, 729494, 1114035, 1114036 ].indexOf(user.id) >= 0)

    # Chad Nicely - 495388
    # Umang Chouhan - 496930
    # Hubert Huang - 668118
    # Chris Sun - 729494
    # Ryan Moran - 1114035
    # Atsuya Takagi - 1114036

    if authorized
      msg.send "Maintenance requested by #{user.name} for #{application} on #{environment}."

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr

    else
      msg.send "#{user.name} is not authorized to deploy to #{environment}."

  robot.respond /restore (.*) on (.*)$/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]
    environment = msg.match[2]
    user = msg.message.user
    command = "knife restore --application #{application} --environment #{environment}"
    authorized = (environment != 'prod' or [ 495388, 496930, 668118, 729494, 1114035, 1114036 ].indexOf(user.id) >= 0)

    # Chad Nicely - 495388
    # Umang Chouhan - 496930
    # Hubert Huang - 668118
    # Chris Sun - 729494
    # Ryan Moran - 1114035
    # Atsuya Takagi - 1114036

    if authorized
      msg.send "Restore requested by #{user.name} for #{application} on #{environment}."

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr

    else
      msg.send "#{user.name} is not authorized to deploy to #{environment}."

  robot.respond /deploy (.*) to (.*)$/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]
    environment = msg.match[2]
    user = msg.message.user
    command = "knife deploy --application #{application} --environment #{environment}"
    authorized = (environment != 'prod' or [ 495388, 496930, 668118, 729494, 1114035, 1114036 ].indexOf(user.id) >= 0)

    # Chad Nicely - 495388
    # Umang Chouhan - 496930
    # Hubert Huang - 668118
    # Chris Sun - 729494
    # Ryan Moran - 1114035
    # Atsuya Takagi - 1114036

    if authorized
      msg.send "Deploy requested by #{user.name} for #{application} to #{environment}."

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr
    else
      msg.send "#{@user.name} is not authorized to deploy to #{environment}."

  robot.hear /.*\'assessment\' (fixed|passed).*/i, (msg) ->
    @exec = require('child_process').exec

    application = 'assessment'
    environment = 'RC'
    command = "knife deploy --application #{application} --environment #{environment}"

    msg.send "Build #{application} passed. Deploying #{application} to #{environment}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.hear /.*\'delta\.com\' (fixed|passed).*/i, (msg) ->
    @exec = require('child_process').exec

    application = 'delta'
    environment = 'RC'
    command = "knife deploy --application #{application} --environment #{environment}"

    msg.send "Build #{application} passed. Deploying #{application} to #{environment}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

  robot.hear /.*\'start\.me\' (fixed|passed).*/i, (msg) ->
    @exec = require('child_process').exec

    application = 'start'
    environment = 'RC'
    command = "knife deploy --application #{application} --environment #{environment}"

    msg.send "Build #{application} passed. Deploying #{application} to #{environment}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
