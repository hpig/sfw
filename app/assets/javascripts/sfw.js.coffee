app = angular.module 'sfw', ['ngResource']

app.config ($routeProvider, $locationProvider) ->
  #$locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/projects/'
  $routeProvider.when '/projects/', templateUrl: '/angular/projects', controller: 'ProjectsCtrl'
  $routeProvider.when '/projects/:project_id/', templateUrl: '/angular/sprints', controller: 'SprintsCtrl'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
