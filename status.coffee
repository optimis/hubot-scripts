# Allows hubot to track user statuses with away messages.
#
# /status <message> - sets your status message
# /status - clears your status message

module.exports = (robot) ->
  # DEPRECATED INTERFACE
  robot.respond /status (.*)/i, (msg) ->
    user = msg.message.user
    away_message = msg.match[1].trim()
    robot.brain.data.users[user.id].away_message = away_message
    msg.reply "OK, your status is #{away_message}"
    msg.reply "\"ob: status <your message>\" is deprecated. Please use \"/status <your message>\" instead. Thanks!"

  robot.hear /I('?)m back/i, (msg) ->
    user = msg.message.user
    robot.brain.data.users[user.id].away_message = null
    msg.reply "Welcome back! I have cleared your away message."
    msg.reply "\"I'm back\" is deprecated. Please use \"/clear\" instead. Thanks!"

  # NEW HOTNESS
  robot.hear /\/status (.*)/i, (msg) ->
    user = msg.message.user
    away_message = msg.match[1].trim()
    robot.brain.data.users[user.id].away_message = away_message
    msg.reply "I have set your status to: #{away_message}"

  robot.hear /\/status$/i, (msg) ->
    user = msg.message.user
    away_message = robot.brain.data.users[user.id].away_message
    if away_message is null
      msg.reply "You do not have a status message set."
    else
      msg.reply "Your current status is: #{away_message}"

  robot.hear /\/clear$/i, (msg) ->
    user = msg.message.user
    robot.brain.data.users[user.id].away_message = null
    msg.reply "I have cleared your status message."

  robot.hear /(.*)\:(.*)/i, (msg) ->
    name = msg.match[1]
    users = robot.usersForFuzzyName(name)
    if users.length is 1
        user = users[0]
        if user.away_message
          msg.reply "#{name} is #{user.away_message}."
