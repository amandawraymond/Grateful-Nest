(function(module) {
  var listServiceDef = [
    'List',
    ListServiceFunc
  ];
  module.service('ListService', listServiceDef);

  function ListServiceFunc(List) {
    return {
        getAll: _getAll,
        getList: _getList,
        addList: _addList,
        addItem: _addItem
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

    function _addList(opts) {
      return List.save(opts, function(data) {
        return data;
      });
    }

    function _addItem(opts) {
      return List.addItem(opts, function(data) {
        return data;
      });
    }
  }
})(angular.module('gratefulNest'));
