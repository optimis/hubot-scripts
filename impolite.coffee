# ImPolite.
#
# Make ob swear.

module.exports = (robot) ->

  wtf_responses = [
    'WTF!',
    'GTFO!',
    'STFU!',
    "That's your problem, bro.",
    'Now, now...',
    'Simmah down now.'
  ]

  robot.respond /(wtf|gtfo|stfu)/i, (msg) ->
    msg.reply msg.random wtf_responses

  robot.hear /(megatron)/i, (msg) ->
    msg.reply 'Hey! What is this "megatron"?'

  robot.hear /(bootstrap)/i, (msg) ->
    msg.reply 'Hey! What is this "bootstrap"?'
