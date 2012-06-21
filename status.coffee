# Allows hubot to track user statuses with away messages.

module.exports = (robot) ->
  robot.respond /status\:(.*)$/i, (msg) ->
    user = msg.message.user
    away_message = match[1].trim()
    robot.brain.data.users[user.id].away_message = away_message
    msg.send "OK, your status is #{away_message}"

  robot.respond /I('?)m back/i, (msg) ->
    user = msg.message.user
    robot.brain.data.users[user.id].away_message = null
    msg.send "Welcome back!"

  robot.hear /(.*)\:(.*)/i, (msg) ->
    name = msg.match[1]
    users = robot.usersForFuzzyName(name)
    if users.length is 1
        user = users[0]
        if user.away_message
          msg.send "#{name} is #{user.away_message}."
