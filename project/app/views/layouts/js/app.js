'use strict';

var app = angular.module('AngularToDoListApp', []);

app.controller('AngularToDoListController', ['$scope', '$http', function($scope, $http) {
  // begin

  $scope.currentlyTalkingToTheServer = true;
  $http.get('/todoitems.json')
    .success(function(data, status, headers, config) {
      $scope.items = data;
      $scope.currentlyTalkingToTheServer = false;
    })
    .error(function(data, status, headers, config) {
      console.log('Error when fetching items.');
    });
}]);