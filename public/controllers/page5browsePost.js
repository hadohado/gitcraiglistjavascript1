/**
 * Created by hadoh on 6/8/2016.
 */

//angular.module('customDirApp', [])
//    .controller('customDirAppCtrl', ['$scope', function ($scope) {
angular.module('page5browsePost', [])
    .controller('page5browsePostCtrl', ['$scope','$http',  function ($scope, $http) {
        console.log("Hi There from angular controller");

        //$http.get('/contactlist').success(function(response) {
        //		console.log("App controller get data I request");
        //		$scope.contactlist = response;
        //});

        // function getData() {
        $scope.getData = function() {
            // $scope.getData = function($http) {
            console.log("Hey I am here your controller ");
            $http.get('/contactlist').success(function(response) {
                console.log("App controller get data I request");
                $scope.contactlist = response;
            });

        }
        
}])




