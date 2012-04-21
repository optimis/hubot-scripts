# ImPolite.
#
# Make ob swear.

module.exports = (robot) ->

  responses = [
    'WTF!'
  ]

  robot.respond /(wtf)/i, (msg) ->
    msg.reply msg.random responses

  robot.hear /(megatron)/i, (msg) ->
    msg.reply 'Hey! What is megatron?'
