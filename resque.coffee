# Description:
#   Shows the status of resque queues
#
# Dependencies:
#   None
#
# Configuration:
#   RESQUE_WEB_URL
#
# Commands:
#   hubot resque - Lists the queues with pending jobs
#
# Author:
#   joshuaflanagan

module.exports = (robot) ->
  url = process.env.RESQUE_WEB_URL || 'http://172.30.41.23:5678'
  robot.respond /resque/i, (msg) ->
    msg.http(url + '/stats.txt')
      .get() (err, res, body) ->
        msg.send format_stats parse_stats body

module.exports = (robot) ->
  robot.respond /ptrc_resque/i, (msg) ->
    msg.send 'got ptrc'
    msg.http('http://172.30.42.1:5678/workers/OptimisPTRC')
      .get() (err, res, body) ->
        html = body
        msg.send parse_workers_stats(body).toString()
    msg.send html


parse_workers_stats = (stats) ->
  parser = new DOMParser()
  xmlDoc = parser.parseFromString(stats,"text/xml")
  xmlDoc.getElementsByClassName('queue-tag')


parse_stats = (stats) ->
  details = {}
  handle_line = (line) ->
    [key,val] = line.split '='
    [group,name] = key.split '.'
    (details[group]||={})[name.replace('+','')] = val
  handle_line response for response in stats.split '\n'
  details


format_stats = (stats) ->
  heading = "#{stats['resque']['pending']} pending jobs. #{stats['resque']['working']} of #{stats['resque']['workers']} workers active."
  queues = ([count,name] for name,count of stats['queues'] when count isnt '0').sort (a,b) -> b[0] - a[0]
  justify = (str, size) ->
    Array(size - str.length + 1).join(' ') + str
  width = Math.max.apply null, (q[1].length for q in queues)
  queue_list = ("#{justify(q[1], width + 1)} : #{q[0]}" for q in queues).join '\n'
  return heading + '\n' + queue_list
