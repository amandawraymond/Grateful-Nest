(function(module) {

  var factoryDef = [
    '$resource',
    ListFunc
  ];

  module.factory('List', factoryDef);

  function ListFunc($resource) {
    var base_url = '/lists/:id'
    var url = base_url + '.json';
    var add_item_url = base_url + '/add_item.json';

    var default_params = {
      id: '@id'
    }

    var additional_methods = {
      addItem: {
          method: 'PUT',
          url: add_item_url
      }
    };

    return $resource(url, default_params, additional_methods); 
  }
})(angular.module('gratefulNest'));
