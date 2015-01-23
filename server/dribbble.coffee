dribbbleAPI = config:
  baseUrl:   "https://api.dribbble.com/v1",
  shots: "/user/shots/"

# Dribbble meteor methods
Meteor.methods loadDribbbleShots: ->
  @unblock()
  Meteor.http.call "GET", "https://api.dribbble.com/v1/user/shots?access_token=" + Meteor.user().services.dribbble.accessToken
