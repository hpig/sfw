app = angular.module 'sfw'

app.factory 'Story', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/stories/:story_id',
            project_id: '@project_id', sprint_id: '@sprint_id', story_id: '@story_id'

app.controller 'StoriesCtrl', @StoriesCtrl = ($scope, $routeParams, Project, Sprint, Story) ->
  $scope.foobar = 'derp'
