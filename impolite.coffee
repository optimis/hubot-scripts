# ImPolite.
#
# Make ob swear.

module.exports = (robot) ->

  wtf_responses = [
    'WTF!',
    'GTFO!',
    'STFU!',
    'Now, now...',
    'Simmah down now.'
  ]

  robot.respond /(wtf|gtfo|stfu)/i, (msg) ->
    msg.reply msg.random wtf_responses
