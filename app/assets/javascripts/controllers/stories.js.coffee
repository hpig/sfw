app = angular.module 'sfw'

app.factory 'Story', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/stories/:story_id',
            project_id: '@project_id', sprint_id: '@sprint_id', story_id: '@id'

app.controller 'StoriesCtrl', @StoriesCtrl = ($scope, Sprint, Story) ->
  $scope.initStory = (sprint_id) ->
    Sprint.get project_id: $scope.project.id, sprint_id: sprint_id, (sprint) ->
      $scope.sprint = sprint

  Story.query project_id: $scope.project.id, sprint_id: $scope.sprint.id, (stories) ->
    $scope.stories = stories

  $scope.createStory = (name, description, points) ->
    Story.save
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      name: name, description: description, points: points, (story) ->
        $scope.stories.push story

  $scope.deleteStory = (id) ->
    Story.delete
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      story_id: id, () ->
        $scope.stories = (s for s in $scope.stories when s.id != id)

  $scope.showStories = false

  $scope.$watch 'showStories', () ->
    $scope.storiesTemplate = if $scope.showStories then '/angular/sprint' else ''
    $scope.showHide = if $scope.showStories then 'Hide' else 'Show'

  $scope.toggleVisible = () ->
    $scope.showStories = !$scope.showStories
