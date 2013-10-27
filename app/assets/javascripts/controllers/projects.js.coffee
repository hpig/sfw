app = angular.module 'sfw'

#app.factory 'Project', ['railsResourceFactory', (railsResourceFactory) ->
#  railsResourceFactory
#    url: '/api/projects'
#    name: 'project'
#]
app.factory 'Project', ($resource) ->
  $resource '/api/projects/:project_id', {project_id: '@project_id'}

app.controller 'ProjectsCtrl', @ProjectsCtrl = ($scope, Project) ->
  $scope.projects = Project.query()
#  $scope.projects.then (projects) ->
