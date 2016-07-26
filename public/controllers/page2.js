/**
 * Created by hadoh on 6/8/2016.
 */

angular.module("page2", [])
    .controller("page2Ctrl",['$scope','$http', function ($scope, $http) { //regCtrl
            $scope.person = {}; // will contain title, email, password, channels, hearFromUs

            $scope.emailInvalid = false;
            $scope.passwordInvalid = false;
            $scope.doShow = false;

            $scope.registeruser =  function(){  // register variable of $scope is defined as a function()


                if(!$scope.loginForm.email.$valid){
                    $scope.emailInvalid = true;
                }
                if(!$scope.loginForm.password.$valid){
                    $scope.passwordInvalid = true;
                }


                if($scope.loginForm.$valid){
                    $scope.doShow = true;

                    console.log("Hey I am validating user  ");

                    $http.post('/loginuser',
                        {
                            Email: $scope.person.email,
                            Password: $scope.person.password // encript password
                        }
                    ).success(function(response) {
                            console.log("App controller SEND register new user");
                            $scope.contactlist = response;
                        }

                    );

                }

               

            };
        }
        ]
    );
