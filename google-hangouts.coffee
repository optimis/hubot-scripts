# Hangout <room name> provides a link to the proper GoogleHangout
module.exports = (robot) ->

  robot.hear /\/(hangout|standup)$/i, (msg) ->
    link = "https://plus.google.com/hangouts/_/916872bde2bb7dfcd36c78e6e5e9229b40db3d24?authuser=1&hl=en"
    msg.send("Optimis Hangout: " + link)
