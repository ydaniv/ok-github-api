mongoose = require('mongoose')
Schema = mongoose.Schema

conf = require('./oauth_providers')

UserSchema = new Schema({})
User

mongooseAuth = require('mongoose-auth')

UserSchema.plugin(mongooseAuth,
  everymodule:
    everyauth:
      User: -> User
  github:
    everyauth:
      myHostname: 'http://local.host:3001'
      appId: conf.github.appId
      appSecret: conf.github.appSecret
      redirectPath: '/'
)

User = mongoose.model('User', UserSchema)
module.exports["User"] = mongoose.model("User")
module.exports["User"].modelName = "User"