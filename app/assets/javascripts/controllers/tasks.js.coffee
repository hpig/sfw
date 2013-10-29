app = angular.module 'sfw'

app.factory 'Task', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/stories/:story_id/tasks/:task_id',
            project_id: '@project_id', sprint_id: '@sprint_id', story_id: '@story_id', task_id: '@id'

app.controller 'TasksCtrl', @TasksCtrl = ($scope, Story, Task) ->
  $scope.initTask = (story_id) ->
    Story.get project_id: $scope.project.id, sprint_id: $scope.sprint.id, story_id: story_id, (story) ->
      $scope.story = story
      console.log story

#  Task.query project_id: $scope.project.id, sprint_id: $scope.sprint.id, story_id: $scope.story.id, (tasks) ->
#    $scope.tasks = tasks

#  $scope.createStory = (name, description, points) ->
#    Story.save project_id: $scope.project.id, sprint_id: $scope.sprint.id, name: name, description: description, points: points,(story) ->
#      $scope.stories.push story

#  $scope.deleteStory = (id) ->
#    Story.delete project_id: $scope.project.id, sprint_id: $scope.sprint.id, story_id: id, () ->
#      $scope.sprints = (s for s in $scope.sprints when s.id != id)
