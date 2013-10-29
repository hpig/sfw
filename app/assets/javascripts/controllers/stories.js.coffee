app = angular.module 'sfw'

app.factory 'Story', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/stories/:story_id',
            project_id: '@project_id', sprint_id: '@sprint_id', story_id: '@story_id'

app.controller 'StoriesCtrl', @StoriesCtrl = ($scope, $routeParams, Project, Sprint, Story) ->
  project_id = $routeParams.project_id
  sprint_id = $routeParams.sprint_id

  $scope.story_project = Project.get project_id: project_id
  $scope.story_sprint = Sprint.get sprint_id: sprint_id
  $scope.stories = Story.query sprint_id: sprint_id

  $scope.create = (begin_date, end_date) ->
    Story.save sprint_id: sprint_id, name: name, description: description, points: points, (story) ->
      $scope.stories.push story

  $scope.delete = (index) ->
    Story.delete sprint_id: sprint_id, story_id: $scope.stories[index].id, () ->
      $scope.stories.splice index, 1
