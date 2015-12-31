{ createAction }  = require 'fastflux'
Words             = require './store'

addWord = createAction (emit) ->
  (payload) ->
    {word} = payload
    emit 
      type: 'add'
      word: word

addWord.subscribe Words.send

module.exports = addWord