# Hangout <room name> provides a link to the proper GoogleHangout
module.exports = (robot) ->

  robot.hear /\/(hangout|standup)$/i, (msg) ->
    link = "https://plus.google.com/hangouts/_/4f45ffdc6c4fcd3ea66c5e75feaea29dc1843c37?authuser=1&hl=en"
    msg.send("Optimis Hangout: " + link)
