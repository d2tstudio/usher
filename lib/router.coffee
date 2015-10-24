Router.configure
  layoutTemplate:   'layout',
  loadingTemplate:  'loading'
  waitOn: ->
    Meteor.subscribe 'users'

Router.route '/about',
  name: 'About'

Router.route '/',
  name: 'home'
  data: ->
    user: ->
      Meteor.users.find()
  onBeforeAction: ->
    if user = Meteor.user()
      Router.go 'profile', {username: user.services.dribbble.username}
    else
      this.next()

Router.route '/:username',
  name: 'profile'
  data: ->
    Meteor.users.findOne({"services.dribbble.username": this.params.username})

Router.route '/directory',
  name: 'directory'
  data: ->
    user: ->
        Meteor.users.find()
