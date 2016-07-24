/**
 * Created by hadoh on 6/8/2016.
 */

// angular.module("registerApp", [])
angular.module("page2", [])
    .controller("page2Ctrl", function ($scope) { //regCtrl
        $scope.person = {}; // will contain name, email, password, channels, hearFromUs
        $scope.nameInvalid = false;
        $scope.emailInvalid = false;
        $scope.passwordInvalid = false;
        $scope.researchInvalid = false;
        $scope.hearFromUsInvalid = false;
        $scope.doShow = false;

        $scope.person.channels = [
            { value: "television", label: "Television" },
            { value: "radio", label: "Radio" },
            { value: "email", label: "Email" },
            { value: "facebook", label: "Facebook" },
            { value: "other-social-media", label: "Other Social Media"},
            { value: "other", label: "Other"}
        ];

        $scope.person.hearFromUs = false;


        $scope.register =  function(){  // register variable of $scope is defined as a function()
            if ( (!$scope.registrationForm.name.$valid))     {
                $scope.nameInvalid = true;
            }

            if(!$scope.registrationForm.email.$valid){
                $scope.emailInvalid = true;
            }
            if(!$scope.registrationForm.password.$valid){
                $scope.passwordInvalid = true;
            }
            if(!$scope.registrationForm.hearFromUs.$valid){
                $scope.hearFromUsInvalid = true;
            }
            if(!$scope.registrationForm.channels.$valid){
                $scope.researchInvalid = true;
            }
            if($scope.registrationForm.$valid){
                $scope.doShow = true;
            }

        };
    });

