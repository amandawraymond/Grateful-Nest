var app = angular.module('gratefulNest', [
  'templates',
  'ui.router',
  'ngAnimate',
  'ngSanitize',
  'ngResource',
  'ng-rails-csrf'
]);

app.config(function($stateProvider, $urlServiceProvider) {

  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'home.html'
    })
    .state('lists', {
      url: '/lists',
      component: 'lists',
      resolve: {
        lists: function(ListService) {
          return ListService.getAll();
        }
      }
    })
    .state('list', {
      url: '/lists/{listId}',
      component: 'list',
      resolve: {
        list: function(ListService, $transition$) {
          return ListService.getList($transition$.params().listId);
        }
      }
    })
    .state('add', {
      url: '/add',
      component: 'addList',
      resolve: {
        list: function(ListService) {
          return ListService.addList();
        }
      }
    })

  $urlServiceProvider.rules.otherwise({ state: 'home' });
})