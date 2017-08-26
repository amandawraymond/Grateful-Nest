var app = angular.module('gratefulNest', [
  'templates',
  'ui.router',
  'ngAnimate',
  'ngSanitize',
  'ngResource'
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
    })
    // ALSO MAKE SURE THAT S-URI-f is lists.list(...params...)
    // .state('lists.list', {
    //   url: '/{listId}',
    //   component: 'list',
    //   resolve: {
    //     list: function(lists, $stateParams) {
    //       return lists.find(function(list) {
    //         return list.id == $stateParams.listId;
    //       });
    //     }
    //   }
    // })

  $urlServiceProvider.rules.otherwise({ state: 'home' });
})