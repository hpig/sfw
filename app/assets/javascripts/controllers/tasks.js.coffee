app = angular.module 'sfw'

app.factory 'Task', ($resource) ->
  $resource '/api/projects/:project_id/sprints/:sprint_id/stories/:story_id/tasks/:task_id',
            project_id: '@project_id', sprint_id: '@sprint_id', story_id: '@story_id', task_id: '@id'

app.controller 'TasksCtrl', @TasksCtrl = ($scope, Story, Task) ->
  $scope.initTask = (story_id) ->
    Story.get project_id: $scope.project.id, sprint_id: $scope.sprint.id, story_id: story_id, (story) ->
      $scope.story = story

  Task.query project_id: $scope.project.id, sprint_id: $scope.sprint.id, story_id: $scope.story.id, (tasks) ->
    $scope.tasks = tasks

  $scope.createTask = (name, description, points) ->
    Task.save
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      story_id: $scope.story.id,
      label: label, description: description, status: status, (task) ->
        $scope.tasks.push task

  $scope.deleteTask = (id) ->
    Task.delete
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      story_id: $scope.story.id,
      task_id: id, () ->
        $scope.tasks = (t for t in $scope.tasks when t.id != id)
