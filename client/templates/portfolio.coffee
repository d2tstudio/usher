Shots = new Meteor.Collection(null)

Template.registerHelper "portfolioHasLoaded", (argument) ->
  Session.get "portfolioHasLoaded"

Template.portfolio.rendered = ->
  Session.set "portfolioHasLoaded", false

  Shots.remove({})
  shots = Meteor.call 'loadDribbbleShots', this.data.services.dribbble.accessToken, (error,results) ->
    if(error)
      console.log(error)
    else
      console.log(results.data)
      Shots.insert shot for shot in results.data
      Session.set "portfolioHasLoaded", true

Template.portfolio.helpers
  shots: ->
    Shots.find()
