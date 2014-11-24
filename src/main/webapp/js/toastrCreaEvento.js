var controllo = (function() {

    var verificaCreazione = function() {

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

        if ($('#titolo').val().length === 0) {
            toastr.error('Title must not be empty!');
            return false;
        }
        if ($('#descrizione').val().length === 0) {
            toastr.error('Description must not be empty!');
            return false;
        }
        if ($('#location').val().length === 0) {
            toastr.error('Location must not be empty!');
            return false;
        }
        if (!(isDate($('#dataInizio').val()))) {
            toastr.error('Start date must not be empty!');
            return false;
        }
        if (!(isDate($('#dataFine').val()))) {
            toastr.error('End date must not be empty!');
            return false;
        }

        if (!(confrontaDate($('#dataInizio').val(), $('#dataFine').val()))) {
            toastr.error('End date antecedent starting date');
            return false;
        }


        return true;

    };

    function isDate(txtDate)

    {

        var currVal = txtDate;

        if (currVal.length === 0)
            return false;

        //Declare Regex 

        var rxDatePattern = /^(\d{1,2})(-)(\d{1,2})(-)(\d{4})(\s)(\d{2})(:)(\d{2})$/;

        var dtArray = currVal.match(rxDatePattern); // is format OK?

        if (dtArray == null)
            return false;

        //Checks for mm/dd/yyyy format.

        dtDay = dtArray[1];

        dtMonth = dtArray[3];

        dtYear = dtArray[5];

        dtHour = dtArray[7];

        dtMinute = dtArray[9];

        if (dtMonth < 1 || dtMonth > 12)
            return false;

        else if (dtDay < 1 || dtDay > 31)
            return false;

        else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
            return false;

        else if (dtMonth == 2)

        {

            var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));

            if (dtDay > 29 || (dtDay == 29 && !isleap))
                return false;

        }
        if (dtHour > 24 || dtHour < 1)
            return false;
        if (dtMinute > 60 || dtMinute < 0)
            return false;

        return true;

    }
    ;

    function confrontaDate(txtDataInizio, txtDataFine) {

        var currValInizio = txtDataInizio;
        var currValFine = txtDataFine;

        var rxDatePatternI = /^(\d{1,2})(-)(\d{1,2})(-)(\d{4})(\s)(\d{2})(:)(\d{2})$/;
        var rxDatePatternF = /^(\d{1,2})(-)(\d{1,2})(-)(\d{4})(\s)(\d{2})(:)(\d{2})$/;

        var dtArrayI = currValInizio.match(rxDatePatternI);
        var dtArrayF = currValFine.match(rxDatePatternF);

        dtDayInizio = dtArrayI[1];
        dtMonthInizio = dtArrayI[3];
        dtYearInizio = dtArrayI[5];
        dtHourInizio = dtArrayI[7];
        dtMinuteInizio = dtArrayI[9];

        dtDayFine = dtArrayF[1];
        dtMonthFine = dtArrayF[3];
        dtYearFine = dtArrayF[5];
        dtHourFine = dtArrayF[7];
        dtMinuteFine = dtArrayF[9];
        
        if (dtYearFine < dtYearInizio)
            return false;
        else if(dtYearFine == dtYearInizio && dtMonthFine < dtMonthInizio)
            return false;
        else if(dtYearFine == dtYearInizio && dtMonthFine == dtMonthInizio && dtDayFine < dtDayInizio)
            return false;
        
        else if (dtYearFine == dtYearInizio && dtMonthFine == dtMonthInizio && dtDayFine == dtDayInizio && dtHourFine <= dtHourInizio && dtMinuteFine <= dtMinuteInizio)
            return false;

        return true;

    };

    return {
        verificaEvento: verificaCreazione
    };

}());