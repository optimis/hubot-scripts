# Enables hubot to autodeploy applications.

module.exports = (robot) ->
  robot.hear /.*\/(.*)#.*passed/i, (msg) ->
    @exec = require('child_process').exec

    application = msg.match[1]
    environment = 'RC'
    # command = "knife deploy --application #{application} --environment #{environment}"

    if application == 'assessment'
      command = "knife ssh -x deploy --attribute ipaddress 'tags:assessment AND chef_environment:rc' 'sudo /usr/local/rbenv/shims/chef-client'"
      msg.send "Build #{application} passed. Deploying #{application} to #{environment}."

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr

  robot.hear /.*optimispt\.com\/master.*pushed.*/i, (msg) ->
    @exec = require('child_process').exec

    # command = "knife deploy --application #{application} --environment #{environment}"

    msg.send "Deploying optimispt.com for testing."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
