gestioneProdotti.controller('ProdottoDetailCtrl', function($scope, $routeParams, dataServices) {
    
    var asyncCallback = function(prodotto){
                        $scope.prodotto = prodotto;
                        },
    error         = function() {
                            $scope.messaggio = 'Errore dal server';
                        };         
    dataServices.getProdotto(asyncCallback,$routeParams.prodottoId,error);                   
});



