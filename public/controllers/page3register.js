/**
 * Created by hadoh on 6/8/2016.
 */

//md5 = require ('js-md5'); // july-27

// angular.module("registerApp", [])
angular.module("page3register", [])
    .controller("page3registerCtrl",['$scope','$http', function ($scope, $http) { //regCtrl
        $scope.person = {}; // will contain title, email, password, channels, hearFromUs
        
        $scope.emailInvalid = false;
        $scope.passwordInvalid = false;
        $scope.doShow = false;
        
        $scope.registeruser =  function(){  // register variable of $scope is defined as a function()
          
    
            if(!$scope.registerUserForm.email.$valid){
                $scope.emailInvalid = true;
            }
            if(!$scope.registerUserForm.password.$valid){
                $scope.passwordInvalid = true;
            }
         

     

            if($scope.registerUserForm.$valid){
                $scope.doShow = true;
                
                console.log("Hey I am writing to database to register new user ");
               
                $http.post('/registeruser',
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

            /*
             CREATE TABLE IF NOT EXISTS `posts` (
             `Post_ID` int(11) NOT NULL AUTO_INCREMENT,
             `Title` char(90) NOT NULL,
             `Price` float DEFAULT NULL,
             `Description` text,
             `Email` char(90) DEFAULT NULL,
             `Agreement` tinyint(1) DEFAULT NULL,
             `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
             `Image_1` text,
             `Image_2` text,
             `Image_3` text,
             `Image_4` text,
             `SubCategory_ID` int(11) DEFAULT NULL,
             `Location_ID` int(11) DEFAULT NULL,
             PRIMARY KEY (`Post_ID`),
             KEY `SubCategory_ID` (`SubCategory_ID`),
             KEY `Location_ID` (`Location_ID`)
             ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
             */
           
        };
    }
    ]
    );

