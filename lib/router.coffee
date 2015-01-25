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
  onBeforeAction: ->
    if Meteor.user()
      Router.go 'profile', {_id: Meteor.userId()}
    else
      this.next()

Router.route 'profile/:_id',
  name: 'profile',
  data: ->
    Meteor.users.findOne(this.params._id)

Router.route '/directory',
  name: 'directory'
  data: ->
    user: ->
      Meteor.users.find()
