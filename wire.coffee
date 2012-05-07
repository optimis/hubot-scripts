# for every day, except april 23
#
# all in the game

module.exports = (robot) ->
  robot.hear /(.*)game(\'?)s changed(.*)/i, (msg) ->
    msg.reply "Game's the same. Just got mo fierce."

  robot.hear /(.*)old days(.*)/i, (msg) ->
    msg.reply 'Well, the thing about the old days...they the old days'

  robot.hear /(.*)bushmill(\'?)s(.*)/i, (msg) ->
    msg.reply "That's protestant whiskey."
