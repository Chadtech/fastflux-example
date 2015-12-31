# Libraries
React     = require 'react'
_         = require 'lodash'

# DOM Elements
{p, a, span, div, input, img} = React.DOM


elements    = [ {}, 'div', 'p', 'a', 'span', 'input' ]
R           = React.DOM
CtFactory   = _.reduce elements, (sum, item) ->
  sum[item] = (className) ->
    ->
      className = [className, @props.className ? '' ].join ''
      props     = _.extend {}, @props, className: className
      R[item].apply R[item], [ props ].concat @props.children
  sum


module.exports = (components) ->
  _.mapValues components, (type, key) ->
    component = CtFactory[type] key
    component = render: component
    component = React.createClass component
    React.createFactory component

