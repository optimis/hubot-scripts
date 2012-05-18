#
# This script generates an Office Space Meme image
#

Util = require "util"

module.exports = (robot) ->

  robot.respond /(boss)( me)? ([^\|]*)\|([^\|]*)/i, (msg) ->
    msg.send Util.inspect(msg, false, 4)
    officeSpaceMemeMe msg, (url) ->
      output = Util.inspect(url, false, 4)
      msg.send output

officeSpaceMemeMe = (msg, query, cb) ->
  msg.http('http://www.troll.me/generate-meme')
    .query(caption1: msg[3], caption2: msg[4], refURL: 'http://www.troll.me/meme/office-space-boss/', catid: '8790', gerateMEME: 'Caption')
    .post() (err, res, body) ->
      cb res
