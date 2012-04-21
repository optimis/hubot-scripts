# ImPolite.
#
# Make ob swear.

module.exports = (robot) ->

  responses = [
    'WTF!'
  ]

  robot.respond /(wtf)/i, (msg) ->
    msg.reply msg.random responses
