#
# I'll pick a place for lunch for you, lazy bastards.
#

module.exports = (robot) ->
  restaurants = [
    'Cholada',
    "Sasabune",
    "Kay & Dave's",
    "Cafe Vida",
    "Casa Nostra",
    "Taj Palace",
    "Beech Street",
    "Vittorio's",
    "Pearl Dragon",
    "Mayberry",
    "Vons",
    "Taste",
    "Gelsons",
    "Cathay Palisades",
    "Subway",
    "Rocco's",
    "Marix Tex Mex"
  ]

  preamble = [
    'How about',
    'What about',
    'I think you might like',
    'You should try',
    'Umm...'
  ]

  robot.respond /(.*)lunch(?! tw| tp| taiwan| taipei)(.*)/i, (msg) ->
    msg.reply msg.random(preamble) + ' ' + msg.random(restaurants)
