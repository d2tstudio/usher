Shots = new Meteor.Collection(null)

Template.portfolio.rendered = ->
  Shots.remove({})
  shots = Meteor.call 'loadDribbbleShots', this.data.services.dribbble.accessToken, (error,results) ->
    if(error)
      console.log(error)
    else
      console.log(results.data)
      Shots.insert shot for shot in results.data

Template.portfolio.helpers
  shots: ->
    Shots.find()
