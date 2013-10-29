app = angular.module 'sfw'

app.factory 'Sprint', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/', project_id: '@project_id', sprint_id: '@id'

app.controller 'SprintsCtrl', @SprintsCtrl = ($scope, $routeParams, Project, Sprint) ->
  project_id = $routeParams.project_id

  Project.get project_id: project_id, (project) ->
    $scope.project = project

  Sprint.query project_id: project_id, (sprints) ->
    $scope.sprints = sprints

  $scope.createSprint = (begin_date, end_date) ->
    Sprint.save project_id: project_id, begin_date: begin_date, end_date: end_date, (sprint) ->
      $scope.sprints.push sprint

  $scope.deleteSprint = (id) ->
    Sprint.delete project_id: project_id, sprint_id: id, () ->
      $scope.sprints = (s for s in $scope.sprints when s.id != id)
