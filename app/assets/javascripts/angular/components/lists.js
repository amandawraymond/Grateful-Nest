(function(module) {
  var Component = {
    templateUrl: 'components/lists.html',
    bindings: {
      lists: '<'
    },
    controller: [
      ControllerFunc
    ]
  }
  module.component('lists', Component);

  function ControllerFunc() {
    console.log("lists COMPONENT")
    var $ctrl;
    this.$onInit = _onInit;

    function _onInit() {
      $ctrl = this;
      console.log("$ctrl.lists", $ctrl.lists)
    }
  }
})(angular.module('gratefulNest'));
