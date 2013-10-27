app = angular.module 'sfw'

app.factory 'Sprint', ($resource) ->
  $resource '/api/projects/:project_id/sprints', {project_id: '@project_id'}

app.controller 'SprintsCtrl', @SprintsCtrl = ($scope, $routeParams, Project, Sprint) ->
  $scope.project = Project.get {project_id: $routeParams.project_id}
  #$scope.sprints = Sprint.get {project_id: $routeParams.project_id}
