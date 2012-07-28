#
# So caremad right now.
#

module.exports = (robot) ->
  images = [
    'http://25.media.tumblr.com/tumblr_m7g8w2Ysdy1rzupqxo1_500.png',
    'http://24.media.tumblr.com/tumblr_m7g8tbZEzO1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m7g8rjJ2r51rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m7g9f7NMqW1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m7g8ywkE471rzupqxo1_500.png',
    'http://24.media.tumblr.com/tumblr_m7kokwKs7u1rzupqxo1_500.jpg',
    'http://25.media.tumblr.com/tumblr_m7g8ppw16Z1rzupqxo1_r1_500.png',
    'http://24.media.tumblr.com/tumblr_m7fpxfkHM81rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m6yowwNQCr1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m6yojmSvEY1rzupqxo1_500.png',
    'http://24.media.tumblr.com/tumblr_m6nx0v03so1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m6nwxg8FJ81rzupqxo1_500.png',
    'http://24.media.tumblr.com/tumblr_m6erlmS2PD1rzupqxo1_500.png',
    'http://24.media.tumblr.com/tumblr_m693zbYuSD1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m632hjVfL91rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m632dhYnNe1rzupqxo1_500.png',
    'http://25.media.tumblr.com/tumblr_m7nieu1JIC1rzupqxo1_500.jpg',
    'http://25.media.tumblr.com/tumblr_m7lqzhCX2v1rzupqxo1_500.jpg'
  ]

  robot.hear /(.*)caremad/i, (msg) ->
    msg.send msg.random(images)
