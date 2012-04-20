#
# I pick a place for lunch for you, lazy basters.
#

module.exports = (robot) ->
  restaurants = [
    "cholada",
    "sasabune",
    "kay & dave's",
    "cafe vida",
    "morgan's cafe",
    "casa nostra",
    "taj palace",
    "beech street",
    "vittorio's",
    "pearl dragon",
    "mayberry",
    "vons",
    "taste",
    "gelsons",
    "cathay palisades",
    "subway",
    "rocco's",
    "marix tex mex"
  ]

  robot.respond /lunch/i, (msg) ->
    msg.reply "here you go: #{msg.random restaurants}"
