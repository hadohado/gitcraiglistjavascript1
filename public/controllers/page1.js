/**
 * Created by hadoh on 6/8/2016.
 */

angular.module("page1", []).controller("page1Ctrl", ['$scope', function ($scope) {
//    angular.module("myApp", []).controller("myController", ['$scope', function ($scope) {
    var instructors = ["Vivek Sharma", "Lory Nuemann", "Andy Hou", "Richard Parriera"];
    var numInst = instructors.length;

    $scope.instructors = instructors;
    $scope.numInst = numInst;
    $scope.showList;

}]);
