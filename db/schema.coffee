define 'User', ->
    property 'email', String, index: true
    property 'password', String
    property 'activated', Boolean, default: false

Project = describe 'Project', () ->
    property 'name', String
    property 'repo', String
