#
# Play "call me maybe" when someone says "call me"
#

module.exports = (robot) ->
  robot.hear /(.*)(call me|hangout|hang out)/i, (msg) ->
    msg.send "/play yodel" 
