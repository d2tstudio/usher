Router.configure
  layoutTemplate:   'layout',
  loadingTemplate:  'loading'
  waitOn: ->
    Meteor.subscribe 'users'

Router.route '/',
  name: 'home'
  data: ->
    user: ->
      Meteor.users.find()

###
  onBeforeAction: ->
    if Meteor.user()
      Router.go 'profile', {_id: Meteor.userId()}
    else
      this.next()
###

Router.route 'profile/:username',
  name: 'profile'
  data: ->
    Meteor.users.findOne({"services.dribbble.username": this.params.username})

Router.route '/directory',
  name: 'directory'
  data: ->
    user: ->
        Meteor.users.find()
