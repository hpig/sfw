app = angular.module 'sfw'

app.factory 'Sprint', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/', project_id: '@project_id', sprint_id: '@sprint_id'

app.controller 'SprintsCtrl', @SprintsCtrl = ($scope, $routeParams, Project, Sprint) ->
  project_id = $routeParams.project_id

  $scope.project = Project.get project_id: project_id
  $scope.sprints = Sprint.query project_id: project_id

  $scope.create = (begin_date, end_date) ->
    Sprint.save project_id: project_id, begin_date: begin_date, end_date: end_date, (sprint) ->
      $scope.sprints.push sprint

  $scope.delete = (index) ->
    Sprint.delete project_id: project_id, sprint_id: $scope.sprints[index].id, () ->
      $scope.sprints.splice index, 1
