Router.configure
  layoutTemplate:   'layout',
  loadingTemplate:  'loading'
  waitOn: ->
    Meteor.subscribe 'users'

Router.route '/about',
  name: 'About'

Router.route '/pro',
  name: 'Pro'

Router.route '/directory',
  name: 'Directory'
  data: ->
    user: ->
        Meteor.users.find()

Router.route '/:username',
  name: 'Profile'
  data: ->
    Meteor.users.findOne({"services.dribbble.username": this.params.username})

Router.route '/',
  name: 'Home'
  data: ->
    user: ->
      Meteor.users.find()
  onBeforeAction: ->
    if user = Meteor.user()
      Router.go 'Profile', {username: user.services.dribbble.username}
    else
      this.next()
