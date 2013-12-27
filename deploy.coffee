# Allows hubot to switch applications to maintenance mode.
#
# maintain <application> on <environment> - Switches <application> on <environment> to maintenance mode.
# restore <application> on <environment> - Restores <application> on <environment> from maintenance mode.
# deploy <application> to <environment> - Deploys <application> to <environment>.

authorized = (user, environment) ->
  development_team = [
    496930, # Umang Chouhan
    # Timothy Willett
    # Mark Hopkins
    1159232, # Taian Su
    1292120, # Syd Chen
    # Mason Chang
    1430445 # Shunwen Hsiao
  ]
  (environment != 'prod') or development_team.indexOf(user.id) >= 0

module.exports = (robot) ->
  robot.respond /maintain (.*) on (.*)$/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]
    environment = msg.match[2]
    user = msg.message.user
    command = "knife maintain --application #{application} --environment #{environment}"

    if authorized(user, environment)
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

    if authorized(user, environment)
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

    if authorized(user, environment)
      msg.send "Deploy requested by #{user.name} for #{application} to #{environment}."

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr
    else
      msg.send "#{@user.name} is not authorized to deploy to #{environment}."

  robot.respond /my user info/i, (msg) ->
    user = msg.message.user
    msg.reply "Here is your user info: #{JSON.stringify(user)}"
