module.exports = (robot) ->
  restaurants = [
    "Beef noodles",
    "Japanese restaurant",
    "G'Days",
    "India Curry",
    "Clam noddles",
    "Pastas",
    "Hainanse chicken rice"
  ]

  preamble = [
    'How about',
    'What about',
    'I think you might like',
    'You should try',
    'Umm...',
    "I saw a gorgeous girl there while I'm leaving "
  ]

  robot.respond /(.*)lunch(?= tw| tp| taiwan| taipei)(.*)/i, (msg) ->
    msg.reply msg.random(preamble) + ' ' + msg.random(restaurants)
