# Polite.
#
# Say thanks to your robot.

module.exports = (robot) ->

  responses = [
    "You're welcome.",
    'No problem.',
    'Anytime.',
    "Fo' sho'",
    "Don't mention it.",
    'No problemo.'
  ]

  shortResponses = [
    'vw',
    'yw',
    'np',
  ]

  braggingResponses = [
    'Oh, you know how I do.',
    "That's just how I roll."
  ]

  introductions = [
    'Hi!',
    'Hi there!',
    "What's up?",
    'Hey.',
    'Hello.'
  ]

  goodbyes = [
    'Goodbye.',
    'Bye!',
    'See ya!',
    'Later!',
    'Peace.',
    'Ciao!',
    'Au revoir.'
  ]

  shortGoodbyes = [
    'cya',
    'bye'
  ]

  robot.respond /(thanks|thank you|cheers)/i, (msg) ->
    msg.reply msg.random responses

  robot.respond /(nice|nice one)/i, (msg) ->
    msg.reply msg.random braggingResponses

  robot.respond /(ty|thx|tnx)/i, (msg) ->
    msg.reply msg.random shortResponses

  robot.respond /(what'?s up\??|wassup|whassup|hello|hey|hi|sup|howdy|yo|good (morning|evening|afternoon))/i, (msg) ->
    msg.reply msg.random introductions

  robot.respond /(goodbye|see (ya|you)|peace)/i, (msg) ->
    msg.reply msg.random goodbyes

  robot.respond /(bye|cya)/i, (msg) ->
    msg.reply msg.random shortGoodbyes
