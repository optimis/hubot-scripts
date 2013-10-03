# Hangout <room name> provides a link to the proper GoogleHangout
module.exports = (robot) ->

  robot.hear /\/(hangout|standup)$/i, (msg) ->
    link = "https://plus.google.com/hangouts/_/a3a829ec57d8b589ec03674729070a9e1d4e7a0a?authuser=0&hl=en"
    msg.send("FIXED: Optimis Hangout: " + link)
