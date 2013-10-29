app = angular.module 'sfw'

#app.factory 'Project', ['railsResourceFactory', (railsResourceFactory) ->
#  railsResourceFactory
#    url: '/api/projects'
#    name: 'project'
#]

app.factory 'Project', ($resource) ->
  $resource '/api/projects/:project_id', project_id: '@id'

app.controller 'ProjectsCtrl', @ProjectsCtrl = ($scope, Project) ->
  Project.query (projects) ->
    $scope.projects = projects

  $scope.createProject = (name) ->
    Project.save name: name, (project) ->
      $scope.projects.push project

  $scope.deleteProject = (id) ->
    Project.delete project_id: id, () ->
      $scope.projects = (p for p in $scope.projects when p.id != id)
