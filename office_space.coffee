#
# This script generates an Office Space Meme image
#

Util = require "util"

module.exports = (robot) ->

  robot.respond /(boss)( me)? (.*)/i, (msg) ->
    msg.send Util.inspect(msg, false, 4)
    officeSpaceMemeMe msg, (res) ->
      output = Util.inspect(res, false, 4)
      msg.send output

officeSpaceMemeMe = (msg, cb) ->
  msg.http('http://www.troll.me/generate-meme')
    .header('content-length', '139')
    .query(caption1: 'Yeah....', caption2: 'ummm...', refURL: 'http://www.troll.me/meme/office-space-boss/', catid: '8790', gerateMEME: 'Caption')
    .post() (err, res, body) ->
      cb res
