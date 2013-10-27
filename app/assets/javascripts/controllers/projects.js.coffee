app = angular.module 'sfw'

#app.factory 'Project', ['railsResourceFactory', (railsResourceFactory) ->
#  railsResourceFactory
#    url: '/api/projects'
#    name: 'project'
#]

app.factory 'Project', ($resource) ->
  $resource '/api/projects/:project_id', project_id: '@project_id'

app.controller 'ProjectsCtrl', @ProjectsCtrl = ($scope, Project) ->
  $scope.projects = Project.query()

  $scope.create = (name) ->
    Project.save name: name, (project) ->
      $scope.projects.push project

  $scope.delete = (index) ->
    Project.delete project_id: $scope.projects[index].id, () ->
      $scope.projects.splice index, 1
