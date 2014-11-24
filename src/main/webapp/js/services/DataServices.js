gestioneEventi.factory('dataServices', function($http) {
    login = function(asyncCallback, utente, error) {
        $http.post('login.do', utente).
                success(function(data, status, headers, config) {
                    asyncCallback(data);
                }).
                error(function(data, status, headers, config) {
                    error();
                });
    };

    return {
        login: login,
    };
});

