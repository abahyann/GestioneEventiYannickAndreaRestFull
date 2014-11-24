gestioneEventi.controller('LoginCtrl' , function($scope, dataServices) {
    

    var isNotEmpty = function () {

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        
        if ($('#user').val().length === 0) {
            toastr.error('"Username" must not be empty!');
            return false;
        }

        if ($('#psw').val().length === 0) {
            toastr.error('"Password" must not be empty!');
            return false;
        }

        return true;

    },

   
    asyncCallback = function(dati) {
                            //salviamo i dati dell utente
                        },
    error         = function() {
                            $scope.messaggio = 'Errore login';
                        };
    
    $scope.login = function(utente) { 
        if(isNotEmpty())
            dataServices.login(asyncCallback,utente, error)
    };
   
});

