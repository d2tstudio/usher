dribbbleAPI = config:
  baseUrl:   "https://api.dribbble.com/v1",
  shots: "/user/shots/"

# Dribbble meteor methods
Meteor.methods loadDribbbleShots: (accessToken)->
  @unblock()
  Meteor.http.call "GET", "https://api.dribbble.com/v1/user/shots?per_page=24&access_token=" + accessToken
