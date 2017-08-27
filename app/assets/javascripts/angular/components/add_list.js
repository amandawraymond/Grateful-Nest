(function(module) {
  var Component = {
    templateUrl: 'components/add_list.html',
    bindings: {
      list: '<'
    },
    controller: [
      '$state',
      'ListService',
      ControllerFunc
    ]
  }
  module.component('addList', Component);

  function ControllerFunc($state, ListService) {
    var $ctrl;
    this.$onInit = _onInit;

    function _onInit() {
      $ctrl = this;
      $ctrl.saveItem = saveItem;
      
      $ctrl.list_item = {
        original_text: null
      }
    }

    function saveItem() {
      $ctrl.list_item.list_id = $ctrl.list.id;
      ListService.addItem($ctrl.list_item);
      $state.go("lists");
    };
  }
})(angular.module('gratefulNest'));
