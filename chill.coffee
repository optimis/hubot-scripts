module.exports = (robot) ->

  robot.hear /\/chill$/i, (msg) ->
    msg.send('http://www.chillestmonkey.com/img/monkey.gif')
