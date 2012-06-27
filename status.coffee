# Allows hubot to track user statuses with away messages.
#
# ob status <message> - sets your status message
# I'm back - clears your status message

module.exports = (robot) ->
  robot.respond /status (.*)/i, (msg) ->
    user = msg.message.user
    away_message = msg.match[1].trim()
    robot.brain.data.users[user.id].away_message = away_message
    msg.reply "OK, your status is #{away_message}"
    msg.reply "'ob: status <your message>' is deprecated. Please use '/status <your message>' instead.  Thanks!"

  robot.hear /\/status (.*)/i, (msg) ->
    user = msg.message.user
    away_message = msg.match[1].trim()
    robot.brain.data.users[user.id].away_message = away_message
    msg.reply "STATUS: #{away_message}"

  robot.hear /I('?)m back/i, (msg) ->
    user = msg.message.user
    robot.brain.data.users[user.id].away_message = null
    msg.reply "Welcome back! I have cleared your away message."

  robot.hear /(.*)\:(.*)/i, (msg) ->
    name = msg.match[1]
    users = robot.usersForFuzzyName(name)
    if users.length is 1
        user = users[0]
        if user.away_message
          msg.reply "#{name} is #{user.away_message}."
