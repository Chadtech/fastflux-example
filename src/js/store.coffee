{ createStore } = require 'fastflux'

module.exports = 
  createStore 
    getInitialState: -> []
    reducers:
      add: (state, payload) ->
        {word} = payload
        state.concat word