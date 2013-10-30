app = angular.module 'sfw'

app.controller 'TaskCtrl', @TaskCtrl = ($scope, Task) ->
  $scope.initTask = (task_id) ->
    Task.get
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      story_id: $scope.story.id,
      task_id: task_id,
      (task) ->
        $scope.task = task

  $scope.saveTask = (status) ->
    Task.update
      project_id: $scope.project.id,
      sprint_id: $scope.sprint.id,
      story_id: $scope.story.id,
      id: $scope.task.id,
      status: status, (task) ->
        $scope.task = task
        for t in $scope.tasks when t.id == $scope.task.id then do (t) =>
          t.status = status

  $scope.statusOptions = (s for s in ['not-started', 'in-progress', 'in-review', 'done'] when s != $scope.task.status)
