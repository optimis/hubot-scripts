#
# This script picks a random LOLFACE image when you say LOL
#

module.exports = (robot) ->

  robot.hear /(LOL)/, (msg) ->
    imageMe msg, "LOLFACE", (url) ->
      msg.send url

  robot.hear /(ROFL)/, (msg) ->
    imageMe msg, "ROFL", (url) ->
      msg.send url

  robot.hear /(meh)/i, (msg) ->
    imageMe msg, 'meh lolcat', (url) ->
      msg.send url

  robot.hear /(ohai)/i, (msg) ->
    imageMe msg, 'ohai lolcat', (url) ->
      msg.send url

pages = [1,2,3,4,5,6,7,8]

imageMe = (msg, query, cb) ->
  page = msg.random pages
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", start: page, rsz: '8', q: query, safe: 'active')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
