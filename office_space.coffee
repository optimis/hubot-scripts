#
# This script generates an Office Space Meme image
#

Util = require "util"

module.exports = (robot) ->

  robot.respond /(boss)( me)? (.*)|(.*)/i, (msg) ->
    officeSpaceMemeMe msg, (url) ->
      output = Util.inspect(url, false, 4)
      msg.send output

officeSpaceMemeMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(caption1: msg[3], caption2: msg[4], refURL: 'http://www.troll.me/meme/office-space-boss/', q: query, safe: 'active')
    .get() (err, res, body) ->
      cb res
