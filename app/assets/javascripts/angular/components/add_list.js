(function(module) {
  var Component = {
    templateUrl: 'components/add_list.html',
    bindings: {},
    controller: [
      ControllerFunc
    ]
  }
  module.component('addList', Component);

  function ControllerFunc() {
    var $ctrl;
    this.$onInit = _onInit;

    function _onInit() {
      $ctrl = this;
      console.log("ADDLIST COMPONENT this", this)
    }
  }
})(angular.module('gratefulNest'));
