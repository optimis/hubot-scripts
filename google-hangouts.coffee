# Hangout <room name> provides a link to the proper GoogleHangout
module.exports = (robot) ->

  robot.hear /\/(hangout|standup)$/i, (msg) ->
    link = "https://plus.google.com/hangouts/_/event/cbvu4o2nt756p0fi516s68o0gdc?authuser=0&hl=en"
    msg.send("FIXED: Optimis Hangout: " + link)
