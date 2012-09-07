#
# Play "call me maybe" when someone says "call me"
#

module.exports = (robot) ->
  robot.hear /(.*)call me/i, (msg) ->
    msg.send "/play yodel" 
