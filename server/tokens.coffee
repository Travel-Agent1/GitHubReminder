'use strict'

uuid = require 'uuid'
eventBroker = require './eventBroker'
log = require './log'

initialise = ->
  log = log.initialise 'tokens'
  log.info 'initialising'

  eventHandlers =
    generate: (event) ->
      token = uuid.v4().replace /-/g, ''
      log.info "returning token #{token}"
      event.respond token

  eventBroker.subscribe 'tokens', eventHandlers

module.exports = { initialise }

