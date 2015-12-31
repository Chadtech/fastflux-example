(function() {
  var CtFactory, React, ReactDOM, _, a, div, img, input, p, ref, span;

  React = require('react');

  ReactDOM = require('react-dom');

  _ = require('lodash');

  ref = React.DOM, p = ref.p, a = ref.a, span = ref.span, div = ref.div, input = ref.input, img = ref.img;

  CtFactory = {
    div: function(className) {
      return function() {
        var props, ref1;
        className = [className, (ref1 = this.props.className) != null ? ref1 : ''].join(' ');
        props = _.extend({}, this.props, {
          className: className
        });
        return div.apply(div, [props].concat(this.props.children));
      };
    },
    p: function(className) {
      return function() {
        var props, ref1;
        className = [className, (ref1 = this.props.className) != null ? ref1 : ''].join(' ');
        props = _.extend({}, this.props, {
          className: className
        });
        return p.apply(p, [props].concat(this.props.children));
      };
    },
    a: function(className) {
      return function() {
        var props, ref1;
        className = [className, (ref1 = this.props.className) != null ? ref1 : ''].join(' ');
        props = _.extend({}, this.props, {
          className: className
        });
        return a.apply(a, [props].concat(this.props.children));
      };
    },
    span: function(className) {
      return function() {
        var props, ref1;
        className = [className, (ref1 = this.props.className) != null ? ref1 : ''].join(' ');
        props = _.extend({}, this.props, {
          className: className
        });
        return span.apply(span, [props].concat(this.props.children));
      };
    }
  };

  module.exports = function(components) {
    return _.mapValues(components, function(type, key) {
      var component;
      component = CtFactory[type](key);
      component = {
        render: component
      };
      component = React.createClass(component);
      return React.createFactory(component);
    });
  };

}).call(this);
