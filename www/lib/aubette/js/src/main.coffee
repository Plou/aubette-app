
window.$ = window.jQuery = require('../vendors/jquery-1.11.2.min.js')
# Helpers
#
# getHash = require './components/getHash.coffee'
Colorswitch = require('./components/Colorswitch.coffee')
Ui = require('./components/Ui.coffee')
Splash = require('./components/Splash.coffee')
Mondrian = require('./components/Mondrian.coffee')

# Ionic Starter App

# angular.module is a global place for creating, registering and retrieving Angular modules
# 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
# the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic'])

.run( ($ionicPlatform) ->
  $ionicPlatform.ready( ->
    # Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    # for form inputs)

    if(window.cordova && window.cordova.plugins.Keyboard)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)

    ionic.Platform.fullScreen(true, false)
    if(window.StatusBar)
      StatusBar.hide()


    if window.navigator.standalone? && window.navigator.standalone
      $('body').addClass('device-ios device-standalone')
      $('body').removeClass('device-help')

    if /iPad|iPhone|iPod/.test(navigator.platform)
      $('body').addClass('device-ios')
    else if /Android|android|Linux/.test(navigator.platform)
      $('body').addClass('device-android')
    else
      $('body').addClass('device-other')

    splash = new Splash()
    window.controls = new Ui('#ui', [
      {id: 'color', class: Colorswitch, selector: '#color'},
      {id: 'mondrian', class: Mondrian, selector: '#mondrian'}
    ])

    setTimeout(->
      splash.close()
      setTimeout(->
        splash.delete()
      , 1000
      )
    , 0
    )

  )
)
