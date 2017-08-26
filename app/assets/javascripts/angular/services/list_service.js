(function(module) {
  var listServiceDef = [
    'List',
    ListServiceFunc
  ];
  module.service('ListService', listServiceDef);

  function ListServiceFunc(List) {
    return {
        getAll: _getAll,
        getList: _getList
    }

    function _getAll() {
      return List.query({}, function(data) {
        return data;
      });
    }
    function _getList(id) {
      var opts = {
        id: id
      }
      return List.get(opts, function(data) {
        return data;
      });
    }
  }
})(angular.module('gratefulNest'));
