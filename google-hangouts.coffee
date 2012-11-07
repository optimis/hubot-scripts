# Hangout <room name> provides a link to the proper GoogleHangout
module.exports = (robot) ->
  robot.respond /(hangout|standup)\s?(.*)?/i, (msg) ->
    roomname = msg.match[2] || msg.match[1]
    link = "https://plus.google.com/hangouts/_/96f96f14488625552d763e7511c697ab0c0195d5?authuser=1&hl=en"
    msg.send("Optimis Hangout: " + roomname)
    msg.send(link)
