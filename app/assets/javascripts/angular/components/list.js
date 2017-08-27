(function(module) {
  var Component = {
    templateUrl: 'components/list.html',
    bindings: {
      list: '<'
    }
  }
  module.component('list', Component);
})(angular.module('gratefulNest'));
