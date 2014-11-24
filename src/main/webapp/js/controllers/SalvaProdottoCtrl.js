gestioneProdotti.controller('SalvaProdottoCtrl', function($scope, dataServices, $location) {

    var asyncCallback = function(stringa){
                        if(stringa === "error")
                            alert("error");
                        else
                            $location.path('/listaProdotti');
                        },
    error         = function() {
                            $scope.messaggio = 'Errore dal server';
                        };
                        
    $scope.salvaProdotto = function(prodotto) {
        dataServices.salvaProdotto(asyncCallback,prodotto,error); 
    };
});



