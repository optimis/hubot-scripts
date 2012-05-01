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

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query, safe: 'active')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"