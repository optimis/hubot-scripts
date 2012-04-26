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
    imageMe msg, 'megatron', (url) ->
      msg.send url

  robot.hear /(bootstrap)/i, (msg) ->
    msg.reply 'Hey! What is this "bootstrap"?'

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query, safe: 'active')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
