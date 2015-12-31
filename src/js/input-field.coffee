# Libraries
React               = require 'react'
{Component}         = require 'react'
{PropTypes}         = require 'react'
ReactDOM            = require 'react-dom'
_                   = require 'lodash'
addWord             = require './actions'
{createSubscriber}  = require 'fastflux'

# DOM
{input} = React.DOM
CtDom     = require './ct-dom'
CtFactory = require './ct-factory'
{ row
  container
  columnNumber
  point
  column } = CtFactory CtDom


InputField = React.createClass

  getInitialState: ->
    value: ''

  handle: (e) ->
    @setState value: e.target.value

  checkSubmit: (e) ->
    if e.key is 'Enter'
      addWord 
        type: 'add'
        word: e.target.value
      @setState value: ''

  render: ->
    row null,
      column null,
        input
          className:  'cell'
          value:      @state.value
          onChange:   @handle
          onKeyDown:  @checkSubmit


module.exports = React.createFactory InputField
