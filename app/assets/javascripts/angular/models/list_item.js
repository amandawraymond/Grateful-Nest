(function(module) {

  var factoryDef = [
    '$resource',
    ListItemFunc
  ];

  module.factory('ListItem', factoryDef);

  function ListItemFunc($resource) {
    var base_url = '/list/:list_id/list_items/:id/'
    var url = base_url + '.json';

    var default_params = {
        id: '@id'
    }

    var additional_methods = {
    };

    return $resource(url, default_params, additional_methods); 
  }
})(angular.module('gratefulNest'));
