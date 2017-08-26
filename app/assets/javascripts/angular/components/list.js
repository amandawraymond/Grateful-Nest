(function(module) {
  var Component = {
    templateUrl: 'components/list.html',
    bindings: {
      list: '<'
    },
    controller: [
      ControllerFunc
    ]
  }
  module.component('list', Component);

  function ControllerFunc() {
    var $ctrl;
    this.$onInit = _onInit;

    function _onInit() {
      $ctrl = this;
      console.log("LIST COMPONENT this", this)
    }
  }
})(angular.module('gratefulNest'));
