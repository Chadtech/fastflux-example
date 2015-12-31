# Libraries
React               = require 'react'
el                  = React.createElement
{PropTypes}         = require 'react'
{render}            = require 'react-dom'
_                   = require 'lodash'
{createSubscriber}  = require 'fastflux'

# DOM
{div} = React.DOM
CtDom     = require './ct-dom'
CtFactory = require './ct-factory'
{ row
  container
  columnNumber
  point
  column } = CtFactory CtDom

# Components
InputField = require './input-field'

# Store
Words = require './store'


ControllerView = (props) ->

  container null,
    _.map props.words, (word) ->
      row null,
        column null,
          point null, word
    InputField()


ControllerView  = createSubscriber ControllerView
App             = el ControllerView, words: Words
render App, document.getElementById 'content'




