app = angular.module 'sfw', ['ngResource']

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($routeProvider, $locationProvider) ->
  #$locationProvider.html5Mode true

  $routeProvider.when '/',
    redirectTo: '/projects/'

  $routeProvider.when '/projects/',
    templateUrl: '/angular/app',
    controller: 'ProjectsCtrl'

  $routeProvider.when '/projects/:project_id/',
   templateUrl: '/angular/project',
   controller: 'SprintsCtrl'

  $routeProvider.when '/projects/:project_id/:sprint_id/',
    templateUrl: '/angular/sprint',
    controller: 'StoriesCtrl'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
